require "spec_helper"

# TODO: Make these tests pass
describe NotificationMailer do
  describe "notify" do
    before(:all) do
      @event = FactoryGirl.create(:event)
      @user = FactoryGirl.create(:user)
    end

    let(:mail) { NotificationMailer.notify( @user, @event )}

    it "renders the headers" do
      mail.subject.should eq("New Event Notification!")
      mail.to.should eq([@user.email])
      mail.from.should eq(["Notification@WhoRun.It"])
    end

    it "renders the body" do
      mail.body.encoded.should include("WhoRun.It")
      mail.body.encoded.should include(@event.url_key)
    end
  end

end
