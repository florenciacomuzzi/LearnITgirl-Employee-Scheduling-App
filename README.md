# LearnITgirl-Employee-Scheduling-App

<center>Project Origin</center>
==============
The following is a project completed under a LearnIT, Girl! mentorship.

About LearnIT, Girl
--------------------

 "Learn IT, Girl!" is an international mentorship program developed by the 2014 Anita Borg Scholars from Romania, Poland and U.K. The program's aim is to help women learn a programming language while doing an awesome project!

 For more information, visit the site:
    [https://www.learnitgirl.com]

About The Mentee
-----------------
Flo is a junior Computer Science student at The City University of New York, Brooklyn College.


Problem Description
-------------------

A call center has multiple clients. Some contracts require a number of dedicated staff per shift while others pay-per-minute.  The manager needs a scheduling system that will alert them when there are not enough people scheduled to a shift.  Administrator access would allow them to approve requests to switch shifts or take off, to view emergency contact information for employees, and would provide a report of hours required by clients vs. hours covered after adjusting settings for days that veer from the usual requirements, i.e. less staff on holidays and weekends.


Week 1
--------
Tasks for this week:

- Choose between a local or "cloud" development environment.
I chose a cloud environment. For more: [www.koding.com]
- Complete mentor lesson: Intro to Web Development



Week 2
--------
I have created a simple diagram to organize the information I want to store. The relationship between contract types, shifts, and employees requires refinement.

Tasks for this week:

- Review Ruby on Rails: Active Record Associations guide
    [http://guides.rubyonrails.org/association_basics.html]

- Read Michael Hartl's Ruby on Rails Tutorial: Ch. 3 MVC
    [https://www.railstutorial.org/book/beginning#sec-mvc]

- Complete mentor lesson on domain-modelling


Associations
--------------
In Rails, an association is a connection or *relationship* between two Active Record models.

For example, by declaring that one model belongs_to another, you instruct Rails to maintain Primary Key-Foreign Key information between instances of the two models, and you also get a number of utility methods added to your model.

Rails supports six types of associations:

    belongs_to

- sets up a *one-to-one* connection with another model, such that each instance of the declaring model "belongs to" one instance of the other model... think of object composition
- this class *contains the foreign key*
- For example, if your application includes customers and orders, and each order can be assigned to exactly one customer, you'd declare the order model this way

    class Order < ActiveRecord::Base
        belongs_to :customer
    end


    has_one

- sets up a one-to-one connection with another model but, unlike *belongs_to*, this association indicates that each instance of a model contains or possesses **one** instance of another model.
- use where it makes sense i.e. it makes more sense to say that a supplier owns an account than that an account owns a supplier
- For example, if each supplier in your application has only one account, you'd declare the supplier model like this


    class Supplier < ActiveRecord::Base
        has_one :account
    end


    has_many

- indicates a one-to-many connection with another model
- This association indicates that each instance of the model has zero or more instances of another model.
- For example, in an application containing customers and orders, the customer model could be declared like this


    class Customer < ActiveRecord::Base
        has_many :orders
    end


    has_many :through

- used to set up a many-to-many connection with another model
- This association indicates that the declaring model can be matched with zero or more instances of another model by proceeding through a third model.
- set up a has_many :through relationship if you need to work with the relationship model as an independent entity
- For example, consider a medical practice where patients make appointments to see physicians.


    class Physician < ActiveRecord::Base
        has_many :appointments
        has_many :patients, through: :appointments
    end

    class Appointment < ActiveRecord::Base
        belongs_to :physician
        belongs_to :patient
    end

    class Patient < ActiveRecord::Base
        has_many :appointments
        has_many :physicians, through: :appointments
    end




    has_one :through


- sets up a one-to-one connection with another model
- This association indicates that the declaring model can be matched with one instance of another model by proceeding through a third model.
- For example, if each supplier has one account, and each account is associated with one account history.



    has_and_belongs_to_many



- creates a direct many-to-many connection with another model, with no intervening model
- For example, if your application includes assemblies and parts, with each assembly having many parts and each part appearing in many assemblies

Model-View-Controller (MVC)
------------------------------
- architectural pattern which enforces a separation between “domain logic” (also called “business logic”) from the input and presentation logic associated with a graphical user interface (GUI)
- In the case of web applications, the “domain logic” typically consists of data models for things like users, articles, and products, and the GUI is just a web page in a web browser.
- When interacting with a Rails application, a browser sends a request, which is received by a web server and passed on to a Rails controller.
- In some cases, the *controller* will immediately render a *view*, which is a template that gets converted to HTML and sent back to the browser. More commonly for dynamic sites, the controller interacts with a *model* which is a Ruby object that represents an element of the site (such as a user) and is in charge of communicating with the database
