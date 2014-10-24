require 'test_helper'

class ClientTest < ActiveSupport::TestCase

  test "client attributes can't be blank" do
    client = Client.new
    assert client.invalid?
    assert client.errors[:name].any?
    assert client.errors[:surname].any?
    assert client.errors[:phone].any?
    assert client.errors[:birth_date].any?
    assert client.errors[:personal_id].any?
  end

end
