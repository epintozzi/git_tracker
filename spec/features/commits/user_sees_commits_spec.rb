require "rails_helper"

describe "user sees commits" do
  scenario "user visits main page" do
    commit = Commit.create(sha: "0123F", message: "this is the message", user: "epintozzi", timestamp: "1/2/16 12:00:00 UTC")

    visit root_path

    expect(page).to have_content(commit.sha)
    expect(page).to have_content(commit.message)
    expect(page).to have_content(commit.user)
    expect(page).to have_content(commit.timestamp)
  end
end
