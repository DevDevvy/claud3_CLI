import anthropic
import sys

client = anthropic.Anthropic()

# Check if the correct number of arguments is provided
if len(sys.argv) != 3:
    print("Usage: python claude.py arg1 arg2")
    sys.exit(1)

input_variable = sys.argv[1] #query string
temp_variable = float(sys.argv[2]) #temperature (how creative the AI will be 0.1-1, 1 being most creative)
print("Input: ", input_variable)
print("Temperature: ", temp_variable)

with client.messages.stream(
    max_tokens=1024,
    temperature= temp_variable,
    system="You're an advanced AI assistant here to help me in anything I need.",
    messages=[
        {
            "role": "user", 
            "content": input_variable
        },
        # {
        #     "role": "assistant",
            # "content": "Here is the most professional approach:" # This is a prompt to help start the AI answers, uncomment to use
        # }
    ],
    model="claude-3-opus-20240229",
) as stream:
  for text in stream.text_stream:
      print(text, end="", flush=True)