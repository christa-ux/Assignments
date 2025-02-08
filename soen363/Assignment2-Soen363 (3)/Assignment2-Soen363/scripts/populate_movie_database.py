# part 3; the user inputs movie information, and that new movie is saved in the Movie database
import psycopg2


conn = psycopg2.connect(
    host="localhost",
    port="5432",
    dbname="Assignment2-Soen363",
    user="postgres",
    password="Postgres@123"
)
cursor = conn.cursor()


def insert_movie():
    # Prompt user for movie information
    print("Enter the details for the new movie:")
    tmdb_id = int(input("TMDB ID: "))
    imdb_id = input("IMDB ID (optional, press Enter to skip): ")
    watchmode_id = input("Watchmode ID (optional, press Enter to skip): ")
    title = input("Title: ")
    plot = input("Plot: ")
    content_rating = input("Content Rating (e.g., G, PG, PG-13, R, NC-17): ")
    viewer_rating = float(input("Viewer Rating (0-10, with one decimal): "))
    release_year = int(input("Release Year (1888-current year): "))
    original_language = input("Original Language: ")

   
    imdb_id = imdb_id if imdb_id else None
    watchmode_id = watchmode_id if watchmode_id else None


    try:
        cursor.execute("""
            INSERT INTO "Movie" (
                "tmdbID", "imdbID", "watchmodeID", title, plot, "content_Rating", "viewerRating", "releaseYear", "original_language"
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (tmdb_id, imdb_id, watchmode_id, title, plot, content_rating, viewer_rating, release_year, original_language))

       
        conn.commit()
        print("Movie inserted successfully!")

    except psycopg2.Error as e:
        print(f"Error inserting movie: {e}")
        conn.rollback()


insert_movie()


cursor.close()
conn.close()

