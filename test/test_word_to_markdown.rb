require File.join(File.dirname(__FILE__), 'helper')

class TestWordToMarkdown < Test::Unit::TestCase

  def fixture_path(fixture="")
    File.expand_path "fixtures/#{fixture}.htm", File.dirname(__FILE__)
  end

  def validate_fixture(fixture, expected)
    assert_equal expected, WordToMarkdown.new(fixture_path(fixture)).to_s
  end

  should "properly parse italic text" do
    validate_fixture "em", "This word is _italic_."
  end

  should "properly parse bold text" do
    validate_fixture "strong", "This word is **bold**."
  end

  should "properly parse explicit h1's" do
    validate_fixture "h1", "# Heading 1\n\nParagraph text"
  end

  should "properly parse explicit h2's" do
    validate_fixture "h2", "## Heading 2\n\nParagraph text"
  end

  should "properly parse paragraphs" do
    validate_fixture "p", "This is paragraph text."
  end

  should "properly parse multiple-headings" do
    expected = "# H1\n\nParagraph\n\n## H2\n\nParagraph\n\n### H3\n\nParagraph"
    validate_fixture "multiple-headings", expected
  end

  should "properly parse unnumbered lists" do
    validate_fixture "ul", "- One\n- Two\n- Three"
  end

  should "properly parse numbered lists" do
    validate_fixture "ol", "1. One\n\n2. Two\n\n3. Three"
  end

end