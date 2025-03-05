import sys
import subprocess
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
import time
import os

class FileChangeHandler(FileSystemEventHandler):
    def __init__(self, command, files_to_watch):
        self.command = command
        # Convert files to absolute paths for accurate comparison
        self.files_to_watch = [os.path.abspath(file) for file in files_to_watch]

    def on_modified(self, event):
        if event.is_directory:
            return

        # Check if the modified file is one of the files we are watching
        if os.path.abspath(event.src_path) in self.files_to_watch:
            print(f'File changed: {event.src_path}')
            subprocess.call(self.command, shell=True)

def monitor_files(command, files_to_watch):
    event_handler = FileChangeHandler(command, files_to_watch)
    observer = Observer()

    # Schedule the observer for each file's directory
    for file in files_to_watch:
        dir_name = os.path.dirname(os.path.abspath(file))
        observer.schedule(event_handler, dir_name, recursive=False)

    observer.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()

    observer.join()

if __name__ == "__main__":
    # Get the command and files from arguments
    if len(sys.argv) < 3:
        print("Usage: python script.py '<shell_command>' <file1> <file2> ... <fileN>")
        sys.exit(1)

    command = sys.argv[1]
    files_to_watch = sys.argv[2:]

    monitor_files(command, files_to_watch)
