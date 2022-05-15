require 'rails_helper'

RSpec.describe Article, type: :model do
  context "validation tests" do
    it "is title exist" do
     article = Article.new(title: "Test content")
     expect(article.valid?).to eq(false)
    end
    it "is body exist" do
      article = Article.new(body: "test content")
      expect(article.valid?).to eq(false)
    end
    it "is tag exist" do
      article = Article.new(tags: "test content")
      expect(article.valid?).to eq(false)
    end
    it "should be able to save article" do
      article = Article.new(title: "zxc", body: "zxc", tags: "zxc")
      expect(article.save).to eq(true)
    end
  end
  context "scope tests" do
    let(:params){ {title: "zxc", body: "zxc", tags:"zxc"}}
    before(:each) do
      Article.create(params)
       Article.create(params)
       Article.create(params)

    end
  end
end
