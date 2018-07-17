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

                    while (reader.Read())
                    {
                        bluRays.Add(MapToBluRay(reader));
                    }
                }
            }
            catch (SqlException ex)
            {
                throw;
            }

            return bluRays;
        }

        /// <summary>
        /// Returns all of our Genres
        /// </summary>
        /// <returns></returns>
        public IList<string> GetGenres()
        {
            List<string> genres = new List<string>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string sql = "SELECT DISTINCT genre FROM blurays;";
                    SqlCommand cmd = new SqlCommand(sql, conn);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        genres.Add(Convert.ToString(reader["genre"]));
                    }
                }
            }
            catch (SqlException ex)
            {
                throw;
            }

            return genres;
        }

        /// <summary>
        /// Get a specific blu-ray based on Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public BluRay GetBluRay(int id)
        {
            BluRay bluRay = null;

            string sql = "SELECT * FROM blurays WHERE bluray_id = @id;";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // open connection, create new command
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sql, conn);

                    cmd.Parameters.AddWithValue("@id", id);
                    var reader = cmd.ExecuteReader();

                    // only need an if for a single blu-ray, not a while loop
                    if (reader.Read())
                    {
                        // re-use mapping method
                        bluRay = MapToBluRay(reader);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw;
            }

            return bluRay;
        }

        public BluRay MapToBluRay(SqlDataReader reader)
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
