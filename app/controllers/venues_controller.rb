class VenuesController < ApplicationController
  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/venue_list.html.erb" })
  end

  def show
    venue_id = params.fetch("an_id")
    matching_venues = Venue.where({ :id => venue_id }).first
    @the_venue = matching_venues

    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    # insert_venue_record?query_address=1300&query_name=apple2&query_neighborhood=Orange
    venue = Venue.new
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save

    redirect_to("/venues/#{venue.id}")
  end

  def update
    # update_venue/37?query_address=4&query_name=5&query_neighborhood=6
    the_id = params.fetch("the_id")

    venue = Venue.where({ :id => the_id }).first
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save

    redirect_to("/venues/#{venue.id}")
  end

  def destroy
    the_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues
    venue.destroy

    redirect_to("/venues")
  end
end
