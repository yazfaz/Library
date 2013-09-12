class Library
	attr_accessor :users, :books
	def initialize
		@users=[]
		@books={}
		
	end
	
	def add_user(user)
		@users << user
	end
	
	def add_book(book)
		@books[book.title] = book

		# "abc"
		# book = @books["abc"]
		# book.title`
	end
	
	def checkout (user, book_title)
		book = @books[book_title]
		book.due_date = Time.now + (7*24*60*60)
		# book.due_date calls due_date in Book class
		book.status = "checked out" 

	end
	
	def checkin (user, title)
		book = @books[title]
		book.status = "available"
		# because of def in book_status, even when i call checkin, the books are still coming up as checked out bc it's before the due date
		# do i need to reset this somehow? so after being checked in, books go back to being available
	end
	
	def book_status(title)
		# where do i put book in this method 
		book = @books[title]
		if Time.now > book.due_date
			book.status="overdue"
		elsif (book.due_date <= (Time.now + (7*24*60*60))) && (book.due_date >= Time.now)
			# book.due_date <= (Time.now + (7*24*60*60)) && book.due_date <= (Time.now + (6*24*60*60)) && book.due_date <= (Time.now + (5*24*60*60))	&&book.due_date <= (Time.now + (4*24*60*60)) && book.due_date <= (Time.now + (3*24*60*60)) && book.due_date <= (Time.now + (2*24*60*60)) && book.due_date <= (Time.now + (1*24*60*60)) && book.due_date >= (Time.now + (0*24*60*60))
				# trying to say if book is due between today and 7 days from now
			book.status="checked out"
		elsif Time.now > (book.due_date + (30*24*60*60))
		    book.status="lost"
		else
			book.status="available"
		end
	end
	
	def overdue_books
		# if book.status=="overdue"
		# 	puts "#{user},#{book}"
		# else
		# 	puts "Nothing overdue"
		# end
	end
	def book_count
		@books.count
	end
	def list(user)
	 
	end

end

class Book
	attr_accessor :title, :author, :description, :status, :due_date

	# def due_date
	# 	@due_date
	# end
	# def due_date=(new_val)
	# 	@due_date = new_val
	# end

	def initialize(title, author, description)
	  @title=title
	  @author=author
	  @description=description
	  @status = "available"
	  @due_date = nil
	end

end


# book1 = Book.new('Book One', 'Jane', 'desc')
# book2 = Book.new('Book Two', 'Jane', 'desc')
# puts "Book 1 title: #{book1.title}"
# puts "Book 2 title: #{book2.title}"

# # library = Library.new
# # library.add_book(book1)
# # library.add_book(book2)

# puts "# of Books in library: #{library.book_count}"

# library.add_user('Bob')

# library.checkout('Bob', 'Book One')

# book1_status = library.book_status('Book One')
# puts "Status of book 1: #{book1_status}"


# library.checkin('Bob', 'Book One')

book1 = Book.new('Jurassic Park', 'Crichton', 'dinosaurs')
book3= Book.new('Book Three', 'Joe','info') 
# create instance of Book class, called  book 3, with title, author, descr
library = Library.new
library.add_book(book3)
library.add_book(book1)
# add book3 to Library class
library.add_user('Jill')
# add user to Library class
library.checkout('Jill','Book Three')
library.checkout('Jill', 'Jurassic Park')
book1.due_date = Time.now
book3_status = library.book_status('Book Three')
  puts "Status of book 3: #{book3_status}"
book1_status = library.book_status('Jurassic Park')
library.checkin('Jill','Book Three')
library.checkin('Jill', 'Jurassic Park')
  book3_statusnew = library.book_status('Book Three')
    puts "Status of book 3: #{book3_status}"

  book1_statusnew = library.book_status('Jurassic Park')
  puts "Status of book 1: #{book1_status}"

# Need to fix 




