from PIL import Image
for x in range(0,3):
    path = "gaitas\\"+str(x)+".jpg"
    pt= "gaitas\\"+str(x)+".png"
    im1 = Image.open(path)
    im1.save(pt)
