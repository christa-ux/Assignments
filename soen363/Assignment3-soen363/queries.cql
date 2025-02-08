//A 
db.movies.find({ title: { $in: ["Inception", "The Revenant", "The Wolf of Wall Street"] } })


//B
db.movies.aggregate([
    { $group: { _id: { hasWatchModeID: { $ne: ["$watchmodeID", ""] } }, count: { $sum: 1 } } }
])


//c
db.movies.find({ releaseYear: { $gt: 2023 }, viewerRating: { $gte: 5 } })

//D
db.movies.find({ $or: [{ genre_names: /US/ }, { genre_names: /UK/ }] })


//E 
db.moviekeywords.aggregate([
    { $group: { _id: "$movieid", keywordCount: { $sum: 1 } } }, // Count keywords per movie.
    { $sort: { keywordCount: -1 } }, // Sort by keyword count in descending order.
    { $limit: 2 }, // Limit to the top 2 movies.
    {
        $lookup: { // Join with the movies collection to fetch movie details.
            from: "movies",
            localField: "_id",
            foreignField: "mID",
            as: "movieDetails"
        }
    },
    { $unwind: "$movieDetails" }, // Unwind the joined data.
    { $project: { title: "$movieDetails.title", keywordCount: 1 } } // Project the desired fields.
]);


//F
db.movies.find({ original_language: "English" }).sort({ viewerRating: -1 }).limit(5)



//G
db.movies.createIndex({ plot: "text" })


//H 
db.movies.find({ $text: { $search: "superhero" } })
