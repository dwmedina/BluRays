using BluRays.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace BluRays.DALs
{
    public class BluRayDAL
    {
        private readonly string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=bluraydb;Integrated Security=True";

        public BluRayDAL()
        { }

        /// <summary>
        /// Get all of the blu-rays in the collection
        /// </summary>
        /// <returns>A list of blu-rays</returns>
        public IList<BluRay> GetBluRays()
        {
            List<BluRay> bluRays = new List<BluRay>();

            // Try / Catch due to SqlExceptions
            try
            {
                // Create a new connection object
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // Open the connection
                    conn.Open();

                    // Select all blu-rays
                    string sql = "SELECT * FROM blurays ORDER BY bluray_id ASC";

                    // Create the command
                    SqlCommand cmd = new SqlCommand(sql, conn);

                    // Execute the command
                    SqlDataReader reader = cmd.ExecuteReader();
                }
            }
            catch (SqlException ex)
            {
                throw;
            }

            return bluRays;
        }

        public BluRay GetBluRay(int id)
        {
            
        }

        public BluRay MapToEachBluRay(SqlDataReader reader)
        {
            return new BluRay()
            {
                Id = Convert.ToInt32(reader["bluray_id"]),
                Title = Convert.ToString(reader["title"]),
                Description = Convert.ToString(reader["description"]),
                Rating = Convert.ToString(reader["rating"]),
                Genre = Convert.ToString(reader["genre"]),
                Director = Convert.ToString(reader["director"]),
                Writer = Convert.ToString(reader["writer"]),
                ReleaseYear = Convert.ToInt32(reader["release_year"]),
                Runtime = Convert.ToInt32(reader["release_year"]),
                ImageName = Convert.ToString(reader["image_name"])
            };
        }
    }
}
