# Claude3 CLI Interface

This repository provides a convenient way to interact with Claude3, an advanced AI assistant developed by Anthropoc Inc., directly through the command line interface (CLI). It consists of a Python script (`claude.py`) that utilizes the Anthropoc SDK and a shell script (`claude_script.sh`) to handle environment setup and script execution.

## Prerequisites

Before using this repository, ensure you have the following:

1. An API key from Anthropoc. You can obtain it from [Anthropic](https://anthropic.com).
2. Python and pip installed on your system.
3. macOS environment with Zsh shell, if you're using bash just replace anywhere it says .zshrc with .bashrc and it should work the same for you.

## Setup

1. **Set API Key**: Add your Anthropoc API key to your shell environment. Open your terminal and execute the following command, replacing `{Your-API-Key}` with your actual API key:

   ```bash
   echo "ANTHROPIC_API_KEY={Your-API-Key}" >> ~/.zshrc
   ```

2. **Restart Shell**: Restart your shell or reload the shell configuration file for changes to take effect. You can do this by closing and reopening your terminal or running:

   ```bash
   source ~/.zshrc
   ```

3. **Download the Repository**: Clone or download this repository to your local machine.

4. **Set Alias**: Add an alias to easily run the script in the terminal. Execute the following command in your terminal, replacing `/PATH/TO/anthropic` with the path where you've saved the scripts:

   ```bash
   echo "alias ask='/PATH/TO/anthropic/claude_script.sh'" >> ~/.zshrc
   ```

5. **Make Script Executable**: Make the shell script executable using the following command:

   ```bash
   chmod +x /PATH/TO/anthropic/claude_script.sh
   ```

## Usage

To interact with Claude3, follow these steps:

1. Open your terminal.

2. Run the script using the defined alias (`ask`) followed by your query and temperature value. The temperature value indicates how creative the AI's response will be, ranging from 0.1 to 1, where 1 represents maximum creativity.

   ```bash
   ask "Your query here" 0.5
   ```

3. Claude3 will process your query and provide a response, streamed directly to your terminal.

## Additional Notes

- The `claude.py` script accepts two arguments: the query string and the temperature value.
- The script checks for Python and pip installation, creates a virtual environment if one doesn't exist, installs the required dependencies, and runs the query.
- After each query, the virtual environment is deactivated.
- Ensure that your API key is correctly set in your shell environment for the script to function properly.
- You can modify the code as needed and contribute to the repository.
- For any issues or suggestions, feel free to open an issue on GitHub.
- Uncomment the role and content object in the python script and edit it to add a pretext to Claude's answer to jumpstart the generation (i.e if you like step-by-step instructions you can pretext with "Certainly! Here is a list that will help you:", then Claude will output the message in that context
- The system context allows you to give the whole system context (i.e "You are a powerful AI assistant helping me cure cancer" and can give you more control over the AI responses

Now you can start interacting with Claude3 directly from your terminal!
