
class MovieData

  # the constructor of the MovieData class accepts a single parameter, the file
  #name of the main data file. It reads the file content in.
  def initialize()
    @file = "u.data"
    @file2="u1.data"
    @current_file = open(@file)
    @filelist = []

    @file_hash = Hash.new #using users as key
    @movie_hash = Hash.new #using movies as key
  end


  def hash_user()
    @current_file.each do |line| #adding the info to hash
      curr = line.split
      #hash users
      if @file_hash.has_key?(curr[0])
        for a in 1..2 do
          @file_hash[curr[0]].append curr[a] #append movie rating and movie_id
        end
      else
        @file_hash[curr[0]] = [curr[1],curr[2]]
      end

      #hash movies
      if @movie_hash.has_key?(curr[1])
        @movie_hash[curr[1]].append curr[0] #append user and their movie ratings
        @movie_hash[curr[1]].append curr[2]
      else
        @movie_hash[curr[1]] = [curr[0],curr[2]]
      end
    end
  end

  #returns an integer from 1 to 5 to indicate the popularity of a certain movie.
  def popularity(movie_id)
    rate_count = 1
    popular_rate = 0
    unless @movie_hash.has_key?(movie_id)
      return 1
    end
    until rate_count >= @movie_hash[movie_id].size-1
      popular_rate += @movie_hash[movie_id][rate_count].to_i
      rate_count +=2
    end
    if rate_count <2
      return 1
    end
    popular_rate = popular_rate /(rate_count/2)
    return popular_rate
  end

  #this will generate a list of all movie_id's ordered by decreasing popularity
  def popularity_list()
    @movie_hash.keys.sort_by {|key| -popularity(key)}
  end

  #generates a number between 0 and 1 indicating the similarity in movie
  #preferences between user1 and user2. 0 is no similarity.
  def similarity(user1, user2)
    similarity = []
    a = 0
    until a >= @file_hash[user1].size-1
      b = 0
      if @file_hash.has_key?(user2)
        until b >= @file_hash[user2].size-1
          if @file_hash[user1][a] == @file_hash[user2][b]
            #the similarity is 1-(rating1-rating2)/5
            score = ((@file_hash[user1][a+1].to_i - @file_hash[user2][b+1].to_i)/5).abs
            similarity.append score
          end
          b+=2
        end
      end
      a+=2
    end
    if similarity.size == 0
      return 0
    else
      return similarity.sum(0.0) / similarity.size
    end
  end


  #this return a list of users whose tastes are most similar to the tastes of
  #user, the score is how simiar do we want them to be
  def most_similar(user, score)
    user_list = []
    for a in 0..@file_hash.size do
      if similarity(user,a.to_s) >= score
        user_list.append a
      end
    end
    return user_list
  end


end

#start irb
#require_relative "/Users/marco/Desktop/rubylol/movie1/movie_data.rb"
# 
# thing = MovieData.new()
# thing.hash_user()
# puts thing.most_similar("1", 0.8)
# puts thing.popularity_list()[0..9]
# puts thing.popularity_list()[1672..1681]
