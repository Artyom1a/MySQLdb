using MySql.Data.MySqlClient;
using MYSQLAPP.Models;
using Mysqlx.Crud;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace MYSQLAPP.DAOs
{
    public class AnimalsDAO
    {
        private readonly string ConnectionString = "server=localhost;database=STUDIES;uid=root;password=reghjjh236H;";
        private readonly string SQL_insertItem = "insert into Animals(`NAME`, `TYPE`) values {0};";
        private readonly string SQL_selectItems = "select Id,`name`,`type` from animals;";
        public int Add(Animal animal)
        {
            if (animal == null) throw new ArgumentNullException(nameof(animal));
            MySqlConnection connection = Connection();
            if (connection == null) throw new Exception("connection is null");
            try
            {
                MySqlCommand command = new MySqlCommand(string.Format(SQL_insertItem, "(@name0, @type0)"), connection);
                command.Parameters.AddWithValue("@name0", animal.Name);
                command.Parameters.AddWithValue("@type0", animal.Type);
                command.ExecuteNonQuery();
                return (int)command.LastInsertedId;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);
                throw ex;
            }

            finally
            {
                connection.Close();
            }
        }

        public void AddRange(List<Animal> animals)
        {
            if (animals == null) throw new ArgumentNullException(nameof(animals));
            if (animals.Count == 0) return;
            MySqlConnection connection = Connection();
            if (connection == null) throw new Exception("connection is null");
            try
            {
                string[] insert = new string[animals.Count];
                for (int i = 0; i < animals.Count; i++)
                {
                    insert[i] = $"(@name{i}, @type{i})";
                }
                MySqlCommand command = new MySqlCommand(string.Format(SQL_insertItem, string.Join(",", insert)), connection);
                for (int i = 0; i < animals.Count; i++)
                {
                    var animal = animals[i];
                    command.Parameters.AddWithValue($"@name{i}", animal.Name);
                    command.Parameters.AddWithValue($"@type{i}", animal.Type);
                }
                command.ExecuteNonQuery();
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        public List<Animal> GetAnimals()
        {
            MySqlConnection connection = Connection();
            if (connection == null) throw new Exception("connection is null");
            try
            {
                MySqlCommand command = new MySqlCommand(SQL_selectItems, connection);
                List<Animal> animals = new List<Animal>();
                MySqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Animal animal = new Animal();
                    animal.ID = reader.GetInt32(0);
                    animal.Name = reader.GetString(1);
                    animal.Type = reader.GetString(2);
                    animals.Add(animal);
                }
                return animals;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
        private MySqlConnection Connection()
        {
            try
            {
                MySqlConnection connection = new MySqlConnection(ConnectionString);
                connection.Open();
                return connection;
            }

            catch (MySqlException ex)
            {
                return null;
            }

        }


    }
}
