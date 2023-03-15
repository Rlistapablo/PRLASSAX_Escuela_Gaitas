from PIL import Image
for x in range(0,5):
    path = "gaitas\\"+str(x)+".jpg"
    pt= "gaitas\\"+str(x)+".png"
    im1 = Image.open(path)
    re= im1.resize((2,2))
    re.save(pt)
