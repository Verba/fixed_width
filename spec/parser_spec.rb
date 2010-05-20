require File.join(File.dirname(__FILE__), 'spec_helper')

describe FixedWidth::Parser do
  before(:each) do
    @definition = mock('definition', :sections => [])
    @file = mock("file", :gets => nil)
    @file_name = 'test.txt'
    @parser = FixedWidth::Parser.new(@definition, @file_name)
  end

  it "should open and yield the source file" do
    File.should_receive(:open).with(@file_name, 'r').and_yield(@file)
    @parser.parse
  end

  describe "when parsing sections" do
    before(:each) do
      @definition = FixedWidth.define :test do |d|
        d.header do |h|
          h.trap { |line| line[0,4] == 'HEAD' }
          h.column :type, 4
          h.column :file_id, 10
        end
        d.body do |b|
          b.trap { |line| line[0,4] =~ /[^(HEAD|FOOT)]/ }
          b.column :first, 10
          b.column :last, 10
        end
        d.footer do |f|
          f.trap { |line| line[0,4] == 'FOOT' }
          f.column :type, 4
          f.column :file_id, 10
        end
      end
      File.should_receive(:open).with(@file_name, 'r').and_yield(@file)
      @parser = FixedWidth::Parser.new(@definition, @file_name)
    end

    it "should add lines to the proper sections" do
      pending("l and r padding")
      @file.should_receive(:gets).exactly(4).times.and_return(
        'HEAD         1',
        '      Paul    Hewson',
        '      Dave     Evans',
        'FOOT         1',
        nil
      )
      expected = {
        :header => [ {:type => "HEAD", :file_id => "1" }],
        :body => [ 
          {:first => "Paul", :last => "Hewson" },
          {:first => "Dave", :last => "Evans" }
        ],
        :footer => [ {:type => "FOOT", :file_id => "1" }]
      }
      result = @parser.parse
      result.should == expected
    end

    it "should allow optional sections to be skipped" do
      pending("l and r padding")
      @definition.sections[0].optional = true
      @definition.sections[2].optional = true
      @file.should_receive(:gets).twice.and_return('      Paul    Hewson', nil)
      expected = { :body => [ {:first => "Paul", :last => "Hewson" } ] }
      @parser.parse.should == expected
    end

    it "should raise an error if a required section is not found" do
      @file.should_receive(:gets).twice.and_return('      Ryan      Wood', nil)
      lambda { @parser.parse }.should raise_error(FixedWidth::RequiredSectionNotFoundError, "Required section 'header' was not found.")
    end

    # it "raise an error if a section limit is over run"
  end
end