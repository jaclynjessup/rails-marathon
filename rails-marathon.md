#Let's Create a Review Site for galleries!

Let's create a Rails app that allows users to add galleries to the application and add painting they'ves seen while visiting galleries. These are the criteria I want my app to satisfy in terms of listing galleries.

#Things to Think About
- ER Diagrams
- What models should we have?
- What is the relationship between them?

##To Begin
- Create the databases `rake db:create`
- Run `rake`

##Hints
- Don't forget to add flash message functionality in your layout to help display errors, something like this before the yield
```ruby
<% flash.each do |key, value| %>
    <%= value %>
<% end %>
```
- Let the tests guide your code!
- An occasional sanity check of `rake db:test:prepare` couldn't hurt


##App Functionality
- [] A gallery has to have a name, location (that includes city, state, and zip). It can optionally have a description.
- [] Visiting the `/galleries` path should contain a list of galleries.
- [] Visiting the `/galleries/new` path should display a form for adding a new gallery.
- [] If an gallery is saved I should see the new gallery I've added, and if it is not saved I'm left on the `/new` page and displayed an error.
- [] Visiting a specific gallery's page should display information about that gallery
- [] Visiting the root path should display a list of all galleries.

Once I have this set up I want to give visitors of my app the ability to add paintings they've seen while visiting a gallery to that gallery. Specifically I want my app to satisfy the following criteria:

- [] A gallery can have many paintings. Each painting must be for a specific gallery, title, artist, and a timestamp for when they are created.  
- [] A painting can only belong to one gallery, any paintings in this app must be associated to a gallery.
- [] If a painting is saved, I'm redirected to the show page of the gallery the painting belonged to, if it is not saved, I should be left on the new painting form page and render errors associated with the painting.  
- [] Visiting a specific gallery's page should also include all of the paintings for an gallery listed below the gallery information
