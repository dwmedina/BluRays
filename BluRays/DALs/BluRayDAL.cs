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

        /// <summary>
        /// Searches for Blu-rays within the given parameters
        /// </summary>
        /// <param name="genre"></param>
        /// <param name="minLength"></param>
        /// <param name="maxLength"></param>
        /// <returns></returns>
        public IList<BluRay> GetBluRaysBetween(string title, string genre, int? minLength, int? maxLength)
        {
            IList<BluRay> bluRays = new List<BluRay>();

            // Create our SQL query
            string bluRaySQL = @"SELECT * FROM blurays
                                WHERE title LIKE @title AND genre = @genre AND runtime BETWEEN @minLength AND @maxLength;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(bluRaySQL, conn);
                cmd.Parameters.AddWithValue("@title", "%" + title + "%");
                cmd.Parameters.AddWithValue("@genre", genre);
                cmd.Parameters.AddWithValue("@minLength", minLength);
                cmd.Parameters.AddWithValue("@maxLength", maxLength);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    bluRays.Add(MapToBluRay(reader));
                }
            }

            return bluRays;
        }

        public BluRay MapToBluRay(SqlDataReader reader)
        {
            BluRay bluRay = new BluRay();

            return new BluRay()
            {
                Id = Convert.ToInt32(reader["bluray_id"]),
                Title = Convert.ToString(reader["title"]),
                Description = Convert.ToString(reader["description"]),
                Genre = Convert.ToString(reader["genre"]),
                Director = Convert.ToString(reader["director"]),
                Writer = Convert.ToString(reader["writer"]),
                ReleaseYear = Convert.ToInt32(reader["release_year"]),
                Runtime = Convert.ToInt32(reader["runtime"]),
                ImageName = Convert.ToString(reader["image_name"])
            };
        }
    }
}
