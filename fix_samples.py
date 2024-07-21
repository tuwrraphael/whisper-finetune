import sys
import os

readpath = sys.argv[1]
writepath = sys.argv[2]

text = open(readpath+"/text", "r")
audio_paths = open(readpath+"/audio_paths", "r")

text_lines = text.readlines()
audio_paths_lines = audio_paths.readlines()

audio_splitted = []
for i in range(len(audio_paths_lines)):
    splitted_line = audio_paths_lines[i].split(" ")
    audio_splitted.append([splitted_line[0], " ".join(splitted_line[1:]).strip()])

text.close()
audio_paths.close()

if not os.path.exists(writepath):
    os.makedirs(writepath)

text = open(writepath+"/text", "w")
audio_paths = open(writepath+"/audio_paths", "w")

for i in range(len(text_lines)):
    uuid = text_lines[i].split(" ")[0]
    for j in range(len(audio_splitted)):
        uuid2 = audio_splitted[j][0]
        if uuid == uuid2:
            text.write(text_lines[i])
            audio_paths.write(audio_splitted[j][0]+" "+audio_splitted[j][1]+"\n")
            break

text.close()
audio_paths.close()
