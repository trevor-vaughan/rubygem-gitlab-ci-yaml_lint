RSpec.describe Gitlab::Ci::YamlLint do
  it "has a version number" do
    expect(Gitlab::Ci::YamlLint::VERSION).not_to be nil
  end
end
