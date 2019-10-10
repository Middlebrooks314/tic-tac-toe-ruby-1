require_relative './lib/console_user_interface.rb'

describe ConsoleUserInterface do

  let(:output_stream_double) { double("Output Stream") }
  let(:input_stream_double) { double("Input Stream") }
  let(:messages_double) { double("Messages") }
  let(:user_interface) { 
    ConsoleUserInterface.new(
     output_stream: output_stream_double,
     input_stream: input_stream_double,
     messages: messages_double)
    }
  
  it "requires initialization with an argument for input_stream, output_stream, and messages" do 
    expect{ 
      ConsoleUserInterface.new(
        output_stream: output_stream_double,
        input_stream: input_stream_double,
        messages: messages_double)
       }.to_not raise_error

    expect{ 
      ConsoleUserInterface.new(
        output_stream: output_stream_double,
        messages: messages_double)
       }.to raise_error(ArgumentError)

    expect{ 
      ConsoleUserInterface.new(
        input_stream: input_stream_double)
       }.to raise_error(ArgumentError)

    expect{ 
      ConsoleUserInterface.new(
        messages: messages_double)
       }.to raise_error(ArgumentError)

  end
end
