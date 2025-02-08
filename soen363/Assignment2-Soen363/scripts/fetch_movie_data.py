#part 2: 

import requests
import json

def get_movie_data(tmdb_id):
    api_key = "5485d25e3ae4983b2dde41344d804d26"  
    url = f"https://api.themoviedb.org/3/movie/{tmdb_id}?api_key={api_key}"
    
    try:
        response = requests.get(url)
        if response.status_code == 200:
            data = response.json()
            
            # The info we want from the movie
            movie_info = {
                "Title": data.get("title", "N/A"),
                "Release Year": data.get("release_date", "N/A"),
                "Plot": data.get("overview", "No overview available"),
                "Genre": [genre["name"] for genre in data.get("genres", [])],
                "Viewer rating": data.get("vote_average", "N/A"),
                "Original language": data.get("original_language", "N/A"),
                "Country": [country["name"] for country in data.get("production_countries", [])], 
                "IMDb ID": data.get("imdb_id", "N/A"),
                "Watchmode ID": data.get("watchmode_id", "N/A"),
                "Content Rating": data.get("certification", "Not Rated"),
            }

            # Get Actor and Director
            credits_url = f"https://api.themoviedb.org/3/movie/{tmdb_id}/credits?api_key={api_key}"
            credits_response = requests.get(credits_url)
            if credits_response.status_code == 200:
                credits_data = credits_response.json()
                actors = [actor["name"] for actor in credits_data.get("cast", [])]
                directors = [director["name"] for director in credits_data.get("crew", []) if director["job"] == "Director"]
                
                movie_info["Actors"] = actors
                movie_info["Directors"] = directors
            else:
                print(f"Failed to fetch credits for TMDB ID {tmdb_id}: {credits_response.status_code}")

            # Get Keyword
            keywords_url = f"https://api.themoviedb.org/3/movie/{tmdb_id}/keywords?api_key={api_key}"
            keywords_response = requests.get(keywords_url)
            if keywords_response.status_code == 200:
                keywords_data = keywords_response.json()
                keywords = [keyword["name"] for keyword in keywords_data.get("keywords", [])]
                movie_info["Keywords"] = keywords
            else:
                print(f"Failed to fetch keywords for TMDB ID {tmdb_id}: {keywords_response.status_code}")

            # Get AKA
            aka_url = f"https://api.themoviedb.org/3/movie/{tmdb_id}/translations?api_key={api_key}"
            aka_response = requests.get(aka_url)
            if aka_response.status_code == 200:
                aka_data = aka_response.json()
                akas = [translation["data"]["title"] for translation in aka_data.get("translations", [])]
                movie_info["AKAs"] = akas
            else:
                print(f"Failed to fetch AKAs for TMDB ID {tmdb_id}: {aka_response.status_code}")

            # formatted data
            print(json.dumps(movie_info, indent=4))
        else:
            print(f"Failed to fetch data for TMDB ID {tmdb_id}: {response.status_code}")
    
    except Exception as e:
        print(f"An error occurred: {e}")

# Prompt the user for a TMDB ID
tmdb_id = input("Please enter the TMDB ID of the movie: ")
get_movie_data(tmdb_id)
