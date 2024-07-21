import os
import csv
import sys
import librosa

name = sys.argv[1]
skip = int(sys.argv[2])
total = int(sys.argv[3])
rootpath = sys.argv[4]
outputpath = sys.argv[5]

mypath = outputpath + "/" + name

if not os.path.isdir(mypath):
   os.makedirs(mypath)

text = open(mypath+"/text", "w")
audio_paths = open(mypath+"/audio_paths", "w")
possible_paths = []
for i in range(1, 8):
    possible_paths.append(rootpath + "/Alexa_" + str(i) + "/Audio and Transcription/Audio")

def find_audio_file(filename):
    for path in possible_paths:
        if os.path.exists(path + "/" + filename):
            return path + "/" + filename
    return None

lines = open(rootpath+"/Alexa_7/Audio and Transcription/recognitionData-1-1.csv", "r")

max = total

current = 0
skipped = 0

first = True

length = 0.0

reader = csv.reader(lines, delimiter=',', quotechar='"')
for parts in reader:
    if (first):
        first = False
        continue
    if (parts[0] == "Data Not Available"):
        continue
    if (skipped < skip):
        skipped += 1
        continue
    if (current >= max):
        break
    file = parts[4].strip()
    uuid = file.replace(".wav", "")
    text.write(uuid)
    text.write(" ")
    text.write(parts[0])
    text.write("\n")
    file = find_audio_file(file)
    if (file == None):
        raise Exception("File not found for " + uuid)
    length = librosa.get_duration(path=file)
    current += length
    audio_paths.write(uuid)
    audio_paths.write(" ")
    audio_paths.write(file)
    audio_paths.write("\n")

text.close()
audio_paths.close()
print("Done, total duration: " + str(current) + " seconds")