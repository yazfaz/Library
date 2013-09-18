# The Library class is responsible for the actions of a physical library: storing users, books, checking books in and out. 
class Library
  attr_accessor :users, :books
  
  # Sets @users and @books to empty arrays.Both are accessible in other classes.
  def initialize
    @users = []
    @books = []
  end

  # Adds book to @books array
  def add_book(book)
    @books << book
  end

  # Adds user to @users array
  def add_user(user)
    @users << user
  end

# If method can_rent_books? is true and book's status is available, book can be checked out
  def checkout(user, book)
    if user.can_rent_books? && book.status = "available"
      book.status = "checked out"
      book.due_date = Time.now + (7*24*60*60)
      user.checkout_book(book)
    else
      puts "Sorry, that book can't be checked out."
    end
  end
  
  def checkin(user,book)
    book.status = "available"
    book.due_date = nil
    book.renter = nil
    user.books_checked_out.delete(book)
  end

  # Maps through the books_checked_out array to put books checked out per user
  def books_per_user(user)
    user.books_checked_out.collect do |b|
      puts "#{b.title} is due at #{b.due_date}."
    end
  end
end

  
class Book
  
  attr_accessor :title, :author, :description, :status, :due_date
  
  #Sets @title, @author, and @description equal to user input. 
  # 
  # @status is available upon a book being created.
  # 
  # @due_date is set as nil (it will be set upon a book being checked out)
  def initialize(title, author, description)
    @title = title
    @author = author
    @description = description
    @status = 'available'
    @due_date = nil
    @renter = nil
  end

  def status
    if checked_out?
      puts "#{@title} is checked out."
    elsif overdue?
      puts "#{@title} is overdue."
    elsif lost?
      puts "#{@title} is lost."
    else
      puts "#{@title} is available."
    end
  end
  
  def checked_out?
    @status = "checked out" 
  end
  
  def overdue? # If the current time is greater than the book's due date, it is overdue. 
    @status = "overdue" if (Time.now > @due_date) && !@due_date.nil?
  end
  # If a book is more than a month late, it is considered lost. 
  def lost?
   book.status="lost" if Time.now > (book.due_date + (30*24*60*60))
  end
 
end

# The User class shows what books a user has checked out and if they are eligible to check out more.
class User
  attr_accessor :user_name, :books_checked_out
  def initialize (user_name)
    @user_name = user_name
    @books_checked_out = []
  end

  def checkout_book(book)
    @books_checked_out << book
  end
  
  def can_rent_books?
    books_overdue? && books_count == true
  end

  def books_overdue?
    # return false if @books_checked_out.each {|b| b.status == "overdue"}
    @books_checked_out.each {|b| b.status != "overdue"}
  end

  def books_count
    @books_checked_out.count < 2 
  end
 
  def print_overdue
    @books_checked_out.each do |b|
      puts "#{b.to_s} is overdue" if b.status == "overdue"
    end 
  end
end

user1=User.new("Yasmin")
book1=Book.new("title", "author", "description")
book2=Book.new("anothertitle", "anotherauthor", "anotherdesc")
library=Library.new

library.add_book(book1)
library.add_book(book2)
library.add_user(user1)

puts book1.title
puts user1.user_name

puts user1.can_rent_books?

library.checkout(user1,book1)
book1.status

library.books_per_user(user1)

user1.print_overdue
