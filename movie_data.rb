
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
      #puts curr[0]
      if @file_hash.has_key?(curr[0])
        for a in 1..2 do
          @file_hash[curr[0]].append curr[a] #append movie rating and movie_id
        end
      else
        #puts curr[0]
        @file_hash[curr[0]] = [curr[1],curr[2]]
        #puts "hi"
        #puts @file_hash[curr[0]]
      end
    end
  end


  #returns an integer from 1 to 5 to indicate the popularity of a certain movie.
  def popularity(movie_id)
  end

  # this is for the non-hashed version
  #   num = 0
  #   count = 0
  #   @filelist.each do |line|
  #     curr = line.split
  #     if curr[1]== movie_id
  #       num +=curr[2].to_i
  #       count+=1
  #     end
  #   end
  #   if count!=0
  #     return num/count
  #   end
  # end

  #this will generate a list of all movie_id's ordered by decreasing popularity
  def popularity_list
    movie = []
    @filelist.each do |line|
      curr = line.split
      movie.append curr[3]
    end
    movie = movie.sort_by {|m| popularity(m)}
    return movie
  end

  #generate first 10 of popularity
  def popularity_list_frist_10
    ans = []
    count =0
    @filelist.each do |line|
      curr = line.split
      while count < 10
        if popularity(curr[3])!=nil && popularity(curr[3])>=4
          ans.append curr[3]
          puts curr[3]
          count+=1
        end
      end
    end
    return ans
  end


  #generates a number between 0 and 1 indicating the similarity in movie
  #preferences between user1 and user2. 0 is no similarity.
  def similarity(user1, user2)
    puts @file_hash[user1]
    puts @file_hash[user2]
    "11"
  end
  #   sim = 0
  #   u1=[]
  #   u2=[]
  #   ans = []
  #   count = 0
  #   count1=0
  #   moviec = 0
  #   @filelist.each do |line|
  #     curr = line.split
  #     if curr[0]== user1
  #       #add movie and rating to a list
  #       u1.append curr[1] #movie_id
  #       u1.append curr[2]
  #       count+=1
  #     end
  #     if curr[0] == user2
  #       #add movie and rating to a list
  #       u2.append curr[1] #movie_id
  #       u2.append curr[2]
  #       count1+=1
  #     end
  #   end
  #   for a in 0..count+1 do
  #     if a%2==0
  #       for b in 0..count1+1 do
  #         if b%2==0 && u1[a]==u2[b]
  #           moviec+=1
  #           ans.append (u1[a+1].to_i/u2[b+1].to_i).abs
  #         end
  #       end
  #     end
  #   end
  #   sim = ans.sum(0.0) / ans.size
  #   return sim
  # end

  #this return a list of users whose tastes are most similar to the tastes of
  #user u
  def most_similar(u)
    # userlist = []
    # @filelist.each do |line|
    #   curr = line.split
    #   if similarity(u, curr[0])==1.0 && curr[0] != u
    #     userlist.append curr[0]
    #   end
    # end
    # return userlist
    ans = []
    for a in 2..500 do
      #puts similarity("1", a.to_s)
      if similarity("1",a.to_s) ==1
        ans.append a
      end
    end
    return ans
  end


end

#start irb
#require_relative "/Users/marco/Desktop/rubylol/movie1/movie_data.rb"
thing = MovieData.new()
thing.hash_user()
puts thing.file_hash["1"]
#similarity("1", "3")
