import json
import os
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render
# Create your views here.
from datetime import datetime
from drs_app.models import *
import cv2

def login(request):
    return render(request,'index.html')

def logout(request):
    auth.logout(request)
    return render(request,'index.html')

def login_post(request):
    un=request.POST['textfield']
    ps=request.POST['textfield2']
    try:
        ob=login_table.objects.get(username=un,password=ps)
        if ob.type=='admin':
            request.session['lid']=ob.id
            auth_obj = auth.authenticate(username="admin", password="admin")
            if auth_obj is not None:
                auth.login(request, auth_obj)
            return  HttpResponse('''<script>alert("welcome");window.location="/admin_home"</script>''')
        else:
            return  HttpResponse('''<script>alert("Invalid user");window.location="/"</script>''')
    except:
        return HttpResponse('''<script>alert("Invalid user");window.location="/"</script>''')

@login_required(login_url='/')
def admin_home(request):
    return render(request,"admin_index.html")

@login_required(login_url='/')
def manage_playlist(request):
    ob=music_table.objects.all()
    return render(request,"manageplaylist.html",{'val':ob})

@login_required(login_url='/')
def edit(request, id):
    request.session['m_id'] = id
    ob = music_table.objects.get(id=id)
    return render(request,"editplay.html", {'val': ob})

@login_required(login_url='/')
def edit_post(request):
    try:
        yr = request.POST['textfield']
        mu = request.FILES['file']
        fs = FileSystemStorage()
        fn = fs.save(mu.name, mu)
        si = request.POST['textfield3']
        ob = music_table.objects.get(id=request.session['m_id'])
        ob.year = yr
        ob.singer = si
        ob.music = fn
        ob.save()
        return HttpResponse('''<script>alert("Edited");window.location="/manage_playlist#about"</script>''')
    except:
        yr = request.POST['textfield']
        si = request.POST['textfield3']
        ob = music_table.objects.get(id=request.session['m_id'])
        ob.year = yr
        ob.singer = si
        ob.save()
        return HttpResponse('''<script>alert("Edited");window.location="/manage_playlist#about"</script>''')


@login_required(login_url='/')
def search_mupl(request):

    nm = request.POST['textfield']
    ob = music_table.objects.filter(Q(singer__icontains=nm)|Q(year__icontains=nm))
    return render(request, "manageplaylist.html", {'val': ob})

@login_required(login_url='/')
def delete(request, id):
    ob = music_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Deleted");window.location="/manage_playlist"</script>''')

@login_required(login_url='/')
def add_new(request):
    return render(request,"addnew.html")

@login_required(login_url='/')
def new_music(request):
    yr=request.POST['textfield']
    mu=request.FILES['file']
    fs=FileSystemStorage()
    fn=fs.save(mu.name,mu)
    si=request.POST['textfield3']
    ob=music_table()
    ob.year=yr
    ob.singer=si
    ob.music=fn
    ob.LOGIN=login_table.objects.get(id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location="/manage_playlist#about"</script>''')

@login_required(login_url='/')
def view_user(request):
    ob=user_table.objects.all()
    return render(request,"Viewuser.html",{'val':ob})

@login_required(login_url='/')
def view_drowsiness(request):
    ob=drowsiness_table.objects.all().order_by("-id")
    for i in ob:
        i.status="viewed"
        i.save()
    return render(request,"Viewdrowsiness.html",{'val':ob})






# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$4web-service






def logincode(request):
    print(request.POST)
    un = request.POST['uname']
    pwd = request.POST['pass']
    print(un, pwd)
    try:
        ob = login_table.objects.get(username=un, password=pwd,type='user')

        if ob is None:
            data = {"task": "invalid"}
        else:
            print("in user function")
            data = {"task": "valid", "id": ob.id}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    except:
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)





def registration(request):
    Fname=request.POST['firstname']
    Lname=request.POST['lastname']
    place= request.POST['place']
    post_office = request.POST['post']
    pin_code = request.POST['pin']
    phone = request.POST['phone']
    email_id = request.POST['email']
    uname = request.POST['username']
    passwd = request.POST['password']

    lob = login_table()
    lob.username = uname
    lob.password = passwd
    lob.type = 'user'
    lob.save()

    userob = user_table()
    userob.firstname = Fname
    userob.lastname = Lname
    userob.place = place
    userob.post = post_office
    userob.pin = pin_code
    userob.phone = phone
    userob.email = email_id
    userob.LOGIN=lob
    userob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)



def  drowsiness(request):
    id=request.POST['lid']
    ob = drowsiness_table.objects.filter(USER__LOGIN__id=id)
    data = []
    for i in ob:
        row = {"img": i.image.url, "date": str(i.date),"status":str(i.status)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)


def  view_musics(request):
    id=request.POST['lid']
    ob = music_table.objects.filter(USER__LOGIN__id=id)
    data = []
    for i in ob:
        row = {"year":i.MUSIC.year,"singer":str(i.MUSIC.singer),"music":i.MUSIC.music.url,}
        data.append(row)
    r = json.dumps(data)
    print (r)
    return HttpResponse(r)
def  dd(request):
    id=request.POST['lid']
    ob=drowsiness_table()
    fn=datetime.now().strftime("%Y%m%d%H%M%S")+".png"
    ob.USER=user_table.objects.get(LOGIN__id=id)
    ob.status = "pending"

    ob.image=fn
    ob.date=datetime.now().strftime("%Y-%m-%d %H:%M")
    ob.save()
    f = cv2.imread(r"C:\Users\anjan\OneDrive\Desktop\GCT\drs\media\s.jpg")
    f = cv2.rotate(f, cv2.ROTATE_90_COUNTERCLOCKWISE)

    cv2.imwrite(r"C:\Users\anjan\OneDrive\Desktop\GCT\drs\media/"+fn, f)
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def edittmusic(request):
    mid=request.POST['lid']
    ob=music_table.objects.filter(LOGIN__id=mid)
    ob1=music_table.objects.filter(LOGIN__id=1)
    ob=ob.union(ob1)

    data=[]
    for i in ob:
        row ={"year": i.year, "singer": str(i.singer), "music": i.music.url,"id":i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def delete_music(request):
    mid=request.POST['mid']
    ob=music_table.objects.get(id=mid)
    ob.delete()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def addmusic(request):
    year=request.POST['year']
    singer=request.POST['singer']
    mu = request.FILES['file']
    fs=FileSystemStorage()
    fp=fs.save(mu.name,mu)
    uid = request.POST['lid']

    ob = music_table()
    ob.music = fp
    ob.singer = singer
    ob.year = year
    ob.LOGIN=login_table.objects.get(id=uid)
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def viewplaylist(request):
    id=request.POST['lid']
    ob = playlist_table.objects.filter(USER__LOGIN__id=id)
    data = []
    for i in ob:
        row = {"year":i.MUSIC.year,"singer":str(i.MUSIC.singer),"music":i.MUSIC.music.url,"id":i.MUSIC.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)


def addplaylist(request):


    mu = request.POST['mid']
    uid = request.POST['lid']
    ob=playlist_table.objects.filter(MUSIC__id=mu,USER__LOGIN__id=uid)
    if len(ob)==0:

        ob = playlist_table()
        ob.MUSIC = music_table.objects.get(id=mu)
        ob.USER=user_table.objects.get(LOGIN__id=uid)
        ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def rplaylist(request):


    mu = request.POST['mid']
    uid = request.POST['lid']
    ob=playlist_table.objects.filter(MUSIC__id=mu,USER__LOGIN__id=uid)
    if len(ob)>0:

        ob[0].delete()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

#plalist edit

def update(request):
    mid=request.POST['mid']
    ob=playlist_table.objects.get(id=mid)
    data=[]
    for i in ob:
        row = { "year": i.MUSIC.year, "singer": str(i.MUSIC.singer), "music": i.MUSIC.music.url}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def editplaylist(request):

    mu = request.POST['mid']
    uid = request.POST['uid']

    ob = playlist_table.objects.get(id=mu)
    ob.MUSIC = music_table.objects.get(id=mu)
    ob.USER = user_table.objects.get(LOGIN__id=uid)
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)


def deleteplaylist(request):
    mid=request.POST['mid']
    ob=playlist_table.objects.get(id=mid)
    ob.delete()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def capture(request):
    print(request.FILES)
    try:
        os.remove(r"C:\Users\anjan\OneDrive\Desktop\GCT\drs\media\s.jpg")
    except:
        pass
    f = request.FILES['files']
    fs=FileSystemStorage()
    fn=fs.save("s.jpg",f)

    f=cv2.imread(r"C:\Users\anjan\OneDrive\Desktop\GCT\drs\media/"+fn)
    frame = cv2.rotate(f, cv2.ROTATE_90_COUNTERCLOCKWISE)

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Detect faces in the grayscale frame
    faces = face_detector(gray)

    for face in faces:
        # Get the facial landmarks
        landmarks = shape_predictor(gray, face)

        # Extract the eye landmarks (assuming a 68-point facial landmark model)
        left_eye = [(landmarks.part(i).x, landmarks.part(i).y) for i in range(36, 42)]
        right_eye = [(landmarks.part(i).x, landmarks.part(i).y) for i in range(42, 48)]

        # Calculate the eye aspect ratios
        left_ear = eye_aspect_ratio(left_eye)
        right_ear = eye_aspect_ratio(right_eye)

        # Display the aspect ratios
        cv2.putText(frame, f'Left EAR: {left_ear:.2f}', (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)
        cv2.putText(frame, f'Right EAR: {right_ear:.2f}', (10, 60), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)
        cv2.imwrite(r"C:\Users\anjan\OneDrive\Desktop\GCT\drs\media\sample.jpg", frame)
        if(left_ear>0.15 and right_ear>0.15):
            data = {"task": "ok"}
            r = json.dumps(data)
            print(r)
            return HttpResponse(r)
        else:
            data = {"task": "closed"}
            r = json.dumps(data)
            print(r)
            return HttpResponse(r)



    data = {"task": "na"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)


import dlib
import cv2
import math

# Load the pre-trained face and eye detectors from dlib
face_detector = dlib.get_frontal_face_detector()
eye_detector = dlib.get_frontal_face_detector()

face_detector = dlib.get_frontal_face_detector()
shape_predictor_path = r"C:\Users\anjan\OneDrive\Desktop\GCT\drs\shape_predictor_68_face_landmarks.dat"  # Replace with the actual path
shape_predictor = dlib.shape_predictor(shape_predictor_path)

# Calculate the aspect ratio of the eyes
def eye_aspect_ratio(eye):
    # Compute the Euclidean distances between the two sets of vertical eye landmarks (x, y)-coordinates
    A = math.dist(eye[1], eye[5])
    B = math.dist(eye[2], eye[4])

    # Compute the Euclidean distance between the horizontal eye landmark (x, y)-coordinates
    C = math.dist(eye[0], eye[3])

    # Compute the eye aspect ratio
    ear = (A + B) / (2.0 * C)

    return ear