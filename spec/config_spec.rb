require "rails_helper"

RSpec.describe Lookbook::Config do
  let(:config) { described_class.new }

  it "supports access via hash or property syntax" do
    expect(config.project_name).to equal config['project_name']
    expect(config.log_level).to equal config['log_level']
  end

  context "without overrides" do
    it "has a project name value" do
      expect(config.project_name).to be_a String
    end
  end 

  context "ui_theme" do
    it "sets the theme if it is in the supported list of themes" do
      config.ui_theme = "zinc"
      expect(config.ui_theme).to eq "zinc"
    end

    it "keeps the default the theme name is not recognised" do
      default_theme = config.ui_theme
      config.ui_theme = "not_a_theme"
      expect(config.ui_theme).to eq default_theme
    end
  end

  context "ui_theme_overrides" do
    it "supports setting theme vars as a hash" do

      config.ui_theme_overrides = {
        divider: "red",
        "toolbar-divider": "blue",
        input_BORDER: "green",
      }

      expect(config.ui_theme_overrides.divider).to eq "red"
      expect(config.ui_theme_overrides.toolbar_divider).to eq "blue"
      expect(config.ui_theme_overrides.input_border).to eq "green"
    end

  end
end