
import sublime
import sublime_plugin
import subprocess # for using Popen


def fileextension(path):
filesplit = path.split('.')
return filesplit[len(filesplit) - 1]


def parentdirectory(path):
pathsplit = path.split('/')
return '/'.join(pathsplit[:len(pathsplit) - 1])


class MyScheme(sublime_plugin.TextCommand):

def run(self, view):
filepath = self.view.file_name()
path = parentdirectory(filepath)
# Verifying extension
if ffileextension(filepath) == 'byco':

command = "ruby %s/vm.rb %s" % (path, filepath)
proc = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
for ln in proc.stdout:
print(ln.decode('utf-8').rstrip('\n'))


class EventListener(sublime_plugin.EventListener):

def on_post_save(self, view):
print("Saved!")
filepath = view.file_name()
ext = fileextension(filepath)
destpath = filepath.replace(ext, "byco") # new extension assigned
path = parentdirectory(filepath)
# Verifying extension
if ext == 'myscm':
command = "ruby %s/compiler.rb %s %s" % (path, filepath, destpath)
subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
print("ran %s" % command)
