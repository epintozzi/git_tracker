require "rails_helper"

describe "POST /api/v1/commits" do
  scenario "receive post request" do

    hash =
      {"payload":
        {
      "ref": "refs/heads/changes",
      "before": "9049f1265b7d61be4a8904a9a27120d2064dab3b",
      "after": "0d1a26e67d8f5eaf1f6ba5c57fc3c7d91ac0fd1c",
      "created": false,
      "deleted": false,
      "forced": false,
      "base_ref": 'null',
      "compare": "https://github.com/baxterthehacker/public-repo/compare/9049f1265b7d...0d1a26e67d8f",
      "head_commit":
        {
          "id": "0d1a26e67d8f5eaf1f6ba5c57fc3c7d91ac0fd1c",
          "tree_id": "f9d2a07e9488b91af2641b26b9407fe22a451433",
          "distinct": true,
          "message": "Update README.md",
          "timestamp": "2015-05-05T19:40:15-04:00",
          "url": "https://github.com/baxterthehacker/public-repo/commit/0d1a26e67d8f5eaf1f6ba5c57fc3c7d91ac0fd1c",
          "author": {
            "name": "baxterthehacker",
            "email": "baxterthehacker@users.noreply.github.com",
            "username": "baxterthehacker"
          },
          "committer": {
            "name": "baxterthehacker",
            "email": "baxterthehacker@users.noreply.github.com",
            "username": "baxterthehacker"
          },
          "added": [

          ],
          "removed": [

          ],
          "modified": [
            "README.md"
          ]
        }
      }.to_json
    }

    post "/api/v1/commits", params: hash

    expect(response).to be_success
    expect(Commit.last.sha).to eq('0d1a26e')
  end
end
