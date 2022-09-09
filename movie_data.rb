
class MovieData

  # the constructor of the MovieData class accepts a single parameter, the file
  #name of the main data file. It reads the file content in.
  def initialize()
    @file = "u.data"
    @current_file = open(@file)
    @filelist = []
    @current_file.each do |line|
      @filelist.append line
    end
  end

  #returns an integer from 1 to 5 to indicate the popularity of a certain movie.
  def popularity(movie_id)
    num = 0
    count = 0
    @filelist.each do |line|
      curr = line.split
      if curr[1]== movie_id
        num +=curr[2].to_i
        count+=1
      end
    end
    return num/count
  end

  #this will generate a list of all movie_id's ordered by decreasing popularity
  def popularity_list
    movie = []
    @filelist.each do |line|
      curr = line.split
      movie.append curr[3]
    end
    return movie
  end

  #generates a number between 0 and 1 indicating the similarity in movie
  #preferences between user1 and user2. 0 is no similarity.
  def similarity(user1, user2)
    sim = 0
    u1=[]
    u2=[]
    ans = []
    count = 0
    count1=0
    moviec = 0
    @filelist.each do |line|
      curr = line.split
      if curr[0]== user1
        #add movie and rating to a list
        u1.append curr[1] #movie_id
        u1.append curr[2]
        count+=1
      end
      if curr[0] == user2
        #add movie and rating to a list
        u2.append curr[1] #movie_id
        u2.append curr[2]
        count1+=1
      end
    end
    for a in 0..count+1 do
      if a%2==0
        for b in 0..count1+1 do
          if b%2==0 && u1[a]==u2[b]
            moviec+=1
            ans.append (u1[a+1].to_i/u2[b+1].to_i).abs
          end
        end
      end
    end
    sim = ans.sum(0.0) / ans.size
    return sim
  end

  #this return a list of users whose tastes are most similar to the tastes of
  #user u
  def most_similar(u)
    userlist = []
    @filelist.each do |line|
      curr = line.split
      if similarity(u, curr[0])==1.0 && curr[0] != u
        userlist.append curr[0]
      end
    end
    return userlist
  end


end


thing = MovieData.new()
puts thing.popularity("12")
puts thing.similarity("65", "130")
#thing.most_similar("65")
puts thing.popularity_list
