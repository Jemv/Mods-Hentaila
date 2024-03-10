import json







if __name__ == '__main__':
    links = []

    with open('manifest.json', 'r') as f:
        data = json.load(f)
        mods = data['files']
    
    for mod in mods:
        project = mod["projectID"]
        file = mod["fileID"]
        link = f"https://www.curseforge.com/api/v1/mods/{project}/files/{file}/download"
        links.append(link)
    
    with open('downloads.txt', 'w') as f:
        for link in links:
            f.write(link)

            if link == links[-1]:
                print("Done!")
                break
            else:
                f.write("\n")
        

