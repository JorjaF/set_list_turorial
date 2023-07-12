require "rails_helper"

RSpec.describe "The Song Show Page" do
  it "displays the song title" do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I Really Like You", length: 213, play_count: 70)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 1000000)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it "displays the name of the artist for the song" do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I Really Like You", length: 213, play_count: 70)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 1000000)

    visit "/songs/#{song.id}"
    save_and_open_page
    expect(page).to have_content(artist.name)
  end
end
