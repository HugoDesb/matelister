require "test_helper"

class InviteMailerTest < ActionMailer::TestCase
  test "submitted" do
    mail = InviteMailer.submitted
    assert_equal "Submitted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
