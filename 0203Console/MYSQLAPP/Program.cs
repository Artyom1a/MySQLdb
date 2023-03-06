// Susing System;
using Microsoft.Extensions.Configuration;
using MYSQLAPP.DAOs;
using MYSQLAPP.Models;
namespace MySqlApp // Note: actual namespace depends on the project name.
{
    internal class Program
    {
        static void Main(string[] args)
        {
            IConfigurationRoot configuration = new ConfigurationBuilder()
          .SetBasePath(Directory.GetCurrentDirectory())
          .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
          .Build();

            string connectionString = configuration.GetConnectionString("MyDatabase");
            //AnimalsDAO query = new AnimalsDAO();
            //Animal animal = new Animal() { Name = "orel", Type = "bird" };
            //Console.WriteLine(query.Add(animal));
            //Console.ReadKey();

            AnimalsDAO query = new AnimalsDAO();
            //Animal animal = new Animal() { Name = "fox", Type = "bird" };
            //Console.WriteLine(query.Add(animal));
            //Console.ReadKey();
            //List<Animal> list = new List<Animal>() {
            //list.Add(new Animal())
            //}

            //List<Animal> list = new List<Animal>
            //{
            //    //new Animal() { Name = "воробей", Type = "bird" },
            //    new Animal() { Name = "синица", Type = "bird" },
            //    new Animal() { Name = "латсочка", Type = "bird" },
            //    new Animal() { Name = "хомочек", Type = "млекопетающие" },
            //    new Animal() { Name = "дятел", Type = "bird" }
            //};
            //query.AddRange(list);

            //List<Animal> animals = query.GetAnimals();
            //foreach (Animal animal in animals)
            //{
            //    Console.WriteLine(animal);
            //}

            //Console.WriteLine(query.GetName("mamal"));
            //query.DeleteItem(1);
            query.UpdateItem(12, "cat", "mammal");


        }
       
    }
}