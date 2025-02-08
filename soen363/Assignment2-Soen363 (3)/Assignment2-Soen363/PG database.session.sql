INSERT INTO movie (
    mid,
    tmdbid,
    imdbid,
    watchmodeid,
    title,
    plot,
    content_Rating,
    viewerrating,
    releaseyear,
    original_language
  )
VALUES (
    mid:integer,
    tmdbid:integer,
    'imdbid:character varying',
    watchmodeid:integer,
    'title:character varying',
    'plot:character varying',
    'content_Rating:character varying',
    viewerrating:numeric,
    releaseyear:integer,
    'original_language:character varying'
  );