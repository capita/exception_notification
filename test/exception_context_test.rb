require 'test_helper'

class ExceptionContextTest < Test::Unit::TestCase
  def test_exceptions_hold_context
    begin
      raise "Foo"
    rescue => err
      assert err.context.kind_of?(Hash), "Exception should have hash as context"
    end
  end
  
  def test_should_be_possible_to_add_context_after_rescue
    begin
      @metadata = "Some context string"
      raise "Foo"
    rescue => err
      err.context["metadata"] = @metadata
      raise err
    end
  rescue => err
    assert_equal "Some context string", err.context["metadata"]
  end
  
  def test_should_have_context_for_readerror
    begin
      File.read('DOESNTEXIST')
    rescue Errno::ENOENT => err
      assert err.context.kind_of?(Hash), "Exception should have hash as context"
    end
  end
end
