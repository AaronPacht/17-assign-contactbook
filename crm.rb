require_relative 'contact.rb'
class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp
  
    print 'Enter Last Name: '
    last_name = gets.chomp
  
    print 'Enter Email Address: '
    email = gets.chomp
  
    print 'Enter a Note: '
    note = gets.chomp
  
    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "contact name:"
    name=gets.chomp
    puts "attribute:"
    attribute=gets.chomp
    puts "new value:"
    new_value=gets.chomp
    n=Contact.find_by("first_name",name)
    n.update(n,attribute,new_value)
  end

  def delete_contact
    puts "name:"
    n=gets.chomp
    m=Contact.find_by("first_name",n)
    Contact.delete(m)
  end

  def display_all_contacts
    Contact.all
  end

  def search_by_attribute
    puts "attribute:"
    attribute=gets.chomp
    puts "value:"
    value=gets.chomp
    p Contact.find_by(attribute,value)
  end

end

a_crm_app = CRM.new
a_crm_app.main_menu