# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
rock = Genre.create(name: 'Rock')
pop = Genre.create(name: 'Pop')
alternativa = Genre.create(name: 'Alternativa')
punk = Genre.create(name: 'Punk')
rnb = Genre.create(name: 'R&B')
hiphop = Genre.create(name: 'Hip Hop')
rap = Genre.create(name: 'Rap')

muse = Artist.create(name: 'Muse') #1
muse.genres<<rock
muse.genres<<alternativa
paramore = Artist.create(name: 'Paramore') #2
paramore.genres<<pop
paramore.genres<<punk
ohwonder = Artist.create(name: 'Oh Wonder') #3
ohwonder.genres<<alternativa
royalblood = Artist.create(name: 'Royal Blood') #4
royalblood.genres<<rock
skyferreira = Artist.create(name: 'Sky Ferreira') #5
skyferreira.genres<<pop
thekillers = Artist.create(name: 'The Killers') #6
thekillers.genres<<rock
thekillers.genres<<alternativa
arianagrande = Artist.create(name: 'Ariana Grande') #7
arianagrande.genres<<pop
macmiller = Artist.create(name: 'Mac Miller') #8
macmiller.genres<<hiphop
macmiller.genres<<rap
iggyazalea = Artist.create(name: 'Iggy Azalea') #9
iggyazalea.genres<<pop
iggyazalea.genres<<hiphop
iggyazalea.genres<<rap
theweeknd = Artist.create(name: 'The Weeknd') #10
theweeknd.genres<<rnb
theweeknd.genres<<hiphop



absolution = Album.create(name: 'Absolution', release: '2003-09-29', artist_id: muse.id)
absolution.genres<<rock
blackholes = Album.create(name: 'Black Holes And Revelations', release: '2006-07-03', artist_id: muse.id)
blackholes.genres<<rock
theresistante = Album.create(name: 'The Resistance', release: '2009-09-14', artist_id: muse.id)
theresistante.genres<<alternativa
secondlove = Album.create(name: 'The Second Love', release: '2012-10-01', artist_id: muse.id)
secondlove.genres<<rock


riot = Album.create(name: 'Riot!', release: '2007-06-12', artist_id: paramore.id)
riot.genres<<punk
brandnewice = Album.create(name: 'Brand New Ice', release: '2009-09-29', artist_id: paramore.id)
brandnewice.genres<<punk
ultralife = Album.create(name: 'Ultralife', release: '2017-07-14', artist_id: ohwonder.id)
ultralife.genres<<alternativa

howdidwegetsodark = Album.create(name: 'How Did We Get So Dark?', release: '2017-06-16', artist_id: royalblood.id)
howdidwegetsodark.genres<<alternativa

nighttime = Album.create(name: 'Night Time, My Time', release: '2013-10-29', artist_id: skyferreira.id)
nighttime.genres<<pop

samstown = Album.create(name: "Sam's Town", release: '2006-10-02', artist_id: thekillers.id)
samstown.genres<<rock
dayandage = Album.create(name: 'Day And Age', release: '2008-11-18', artist_id: thekillers.id)
dayandage.genres<<rock

hotfuss = Album.create(name: 'Hot Fuss', release: '2004-06-07', artist_id: thekillers.id)
hotfuss.genres<<rock


yourstruly = Album.create(name: 'Yours Truly', release: '2013-08-30', artist_id: arianagrande.id)
yourstruly.genres<<pop
myeveything = Album.create(name: 'My Everything', release: '2014-08-25', artist_id: arianagrande.id)
myeveything.genres<<pop
dangerouswoman = Album.create(name: 'Dangerous Woman', release: '2016-05-20', artist_id: arianagrande.id)
dangerouswoman.genres<<pop

# ---------------------------------------- SONGS ------------------------------------------------
# To add mp3 file File.new("#{Rails.root}/path/")
timeisrunningout = Song.create(name: 'Time Is Running Out', lenght: 236, release: '2003-09-29',
                               song_file: File.new("#{Rails.root}/app/assets/audios/muse_time-is-running-out.mp3")) # 1
timeisrunningout.genres<<rock
hysteria = Song.create(name: 'Hysteria', lenght: 227, release: '2003-09-29',
                       song_file: File.new("#{Rails.root}/app/assets/audios/muse_hysteria.mp3")) #2
hysteria.genres<<rock
starlight = Song.create(name: 'Starlight', lenght: 240, release: '206-07-03',
                        song_file: File.new("#{Rails.root}/app/assets/audios/muse_starlight.mp3")) #3
starlight.genres<<rock
starlight.genres<<alternativa
resistance = Song.create(name: 'Resistance', lenght: 347, release: '2009-09-14',
                         song_file: File.new("#{Rails.root}/app/assets/audios/muse_resistance.mp3")) #4
resistance.genres<<alternativa
madness = Song.create(name: 'Madness', lenght: 278, release: '2012-10-01',
                      song_file: File.new("#{Rails.root}/app/assets/audios/muse_madness.mp3")) #5
madness.genres<<alternativa
thatswhatyouget = Song.create(name: "That's What You Get", lenght: 220, release: '2007-06-12',
                              song_file: File.new("#{Rails.root}/app/assets/audios/paramore_thats-what-you-get.m4a")) #6
thatswhatyouget.genres<<pop
miserybusiness = Song.create(name: 'Misery Business', lenght: 212, release: '2007-06-12',
                             song_file: File.new("#{Rails.root}/app/assets/audios/paramore_misery-business.m4a")) #7
miserybusiness.genres<<pop
miserybusiness.genres<<punk
ignorance = Song.create(name: 'Ignorance', lenght: 218, release: '2009-09-29',
                        song_file: File.new("#{Rails.root}/app/assets/audios/paramore_ignorance.mp3")) #8
ignorance.genres<<punk
ultralife_song = Song.create(name: 'Ultralife', lenght: 212, release: '2017-07-14',
                             song_file: File.new("#{Rails.root}/app/assets/audios/oh-wonder_ultralife.mp3")) #9
ultralife_song.genres<<alternativa
lifetimes = Song.create(name: 'Lifetimes', lenght: 233, release: '2017-07-14',
                        song_file: File.new("#{Rails.root}/app/assets/audios/oh-wonder_lifetimes.mp3")) #10
lifetimes.genres<<alternativa
lightsout = Song.create(name: 'Lights Out', lenght: 237, release: '2017-06-16',
                        song_file: File.new("#{Rails.root}/app/assets/audios/royal-blood_lights-out.m4a")) #11
lightsout.genres<<alternativa
lightsout.genres<<rock
yourenottheone = Song.create(name: "You're Not The One", lenght: 237, release: '2013-10-29',
                             song_file: File.new("#{Rails.root}/app/assets/audios/sky-ferreira_youre-not-the-one.m4a")) #12
yourenottheone.genres<<pop
whenyowhereyoung = Song.create(name: 'When You Were Young', lenght: 220, release: '2006-10-02',
                               song_file: File.new("#{Rails.root}/app/assets/audios/the-killers_when-you-were-young.mp3")) #13
whenyowhereyoung.genres<<alternativa
readmymind = Song.create(name: 'Read My Mind', lenght: 247, release: '2006-10-02',
                         song_file: File.new("#{Rails.root}/app/assets/audios/the-killers_read-my-mind.mp3")) #14
readmymind.genres<<alternativa
human = Song.create(name: 'Human', lenght: 246, release: '2008-11-18',
                    song_file: File.new("#{Rails.root}/app/assets/audios/the-killers_human.mp3")) #15
human.genres<<alternativa
mrbrightside = Song.create(name: 'Mr. Brightside', lenght: 223, release: '2004-06-07',
                           song_file: File.new("#{Rails.root}/app/assets/audios/the-killers_mr-brightside.mp3")) # 16
mrbrightside.genres<<alternativa
theway = Song.create(name: 'The Way', lenght: 227, release: '2013-08-30',
                     song_file: File.new("#{Rails.root}/app/assets/audios/ariana-grande_the-way.mp3")) #17
theway.genres<<pop
problem = Song.create(name: 'Problem', lenght: 194, release: '2014-08-25',
                      song_file: File.new("#{Rails.root}/app/assets/audios/ariana-grande_problem.mp3")) #18
problem.genres<<pop
onelasttime = Song.create(name: 'One Last Time', lenght: 197, release: '2014-08-25',
                          song_file: File.new("#{Rails.root}/app/assets/audios/ariana-grande_one-last-time.mp3")) #19
onelasttime.genres<<pop
lovemeharder = Song.create(name: 'Love Me Harder', lenght: 236, release: '2014-08-25',
                           song_file: File.new("#{Rails.root}/app/assets/audios/ariana-grande_love-me-harder.mp3")) #20
lovemeharder.genres<<pop
intoyou = Song.create(name: 'Into You', lenght: 236, release: '2016-05-20',
                      song_file: File.new("#{Rails.root}/app/assets/audios/ariana-grande_into-you.mp3")) #21
intoyou.genres<<pop

ArtistPerformSong.create(song_id: timeisrunningout.id, artist_id: muse.id, role: 0)
ArtistPerformSong.create(song_id: hysteria.id, artist_id: muse.id, role: 0)
ArtistPerformSong.create(song_id: starlight.id, artist_id: muse.id, role: 0)
ArtistPerformSong.create(song_id: resistance.id, artist_id: muse.id, role: 0)
ArtistPerformSong.create(song_id: madness.id, artist_id: muse.id, role: 0)

ArtistPerformSong.create(song_id: thatswhatyouget.id, artist_id: paramore.id, role: 0)
ArtistPerformSong.create(song_id: miserybusiness.id, artist_id: paramore.id, role: 0)
ArtistPerformSong.create(song_id: ignorance.id, artist_id: paramore.id, role: 0)

ArtistPerformSong.create(song_id: ultralife_song.id, artist_id: ohwonder.id, role: 0)
ArtistPerformSong.create(song_id: lifetimes.id, artist_id: ohwonder.id, role: 0)

ArtistPerformSong.create(song_id: lightsout.id, artist_id: royalblood.id, role: 0)

ArtistPerformSong.create(song_id: yourenottheone.id, artist_id: skyferreira.id, role: 0)

ArtistPerformSong.create(song_id: whenyowhereyoung.id, artist_id: thekillers.id, role: 0)
ArtistPerformSong.create(song_id: readmymind.id, artist_id: thekillers.id, role: 0)
ArtistPerformSong.create(song_id: human.id, artist_id: thekillers.id, role: 0)

ArtistPerformSong.create(song_id: theway.id, artist_id: arianagrande.id, role: 0)
ArtistPerformSong.create(song_id: problem.id, artist_id: arianagrande.id, role: 0)
ArtistPerformSong.create(song_id: onelasttime.id, artist_id: arianagrande.id, role: 0)
ArtistPerformSong.create(song_id: lovemeharder.id, artist_id: arianagrande.id, role: 0)
ArtistPerformSong.create(song_id: intoyou.id, artist_id: arianagrande.id, role: 0)

ArtistPerformSong.create(song_id: theway.id, artist_id: macmiller.id, role: 1)

ArtistPerformSong.create(song_id: problem.id, artist_id: iggyazalea.id, role: 1)

ArtistPerformSong.create(song_id: lovemeharder.id, artist_id: theweeknd.id, role: 1)

SongComposesAlbum.create(song_id: timeisrunningout.id, album_id: absolution.id, track_number: 3)
SongComposesAlbum.create(song_id: hysteria.id, album_id: absolution.id, track_number: 8)
SongComposesAlbum.create(song_id: starlight.id, album_id: blackholes.id, track_number: 2)
SongComposesAlbum.create(song_id: resistance.id, album_id: theresistante.id, track_number: 2)
SongComposesAlbum.create(song_id: madness.id, album_id: secondlove.id, track_number: 2)
SongComposesAlbum.create(song_id: thatswhatyouget.id, album_id: riot.id, track_number: 2)
SongComposesAlbum.create(song_id: miserybusiness.id, album_id: riot.id, track_number: 4)
SongComposesAlbum.create(song_id: ignorance.id, album_id: brandnewice.id, track_number: 2)
SongComposesAlbum.create(song_id: ultralife_song.id, album_id: ultralife.id, track_number: 2)
SongComposesAlbum.create(song_id: lifetimes.id, album_id: ultralife.id, track_number: 3)
SongComposesAlbum.create(song_id: lightsout.id, album_id: howdidwegetsodark.id, track_number: 2)
SongComposesAlbum.create(song_id: yourenottheone.id, album_id: nighttime.id, track_number: 7)
SongComposesAlbum.create(song_id: whenyowhereyoung.id, album_id: samstown.id, track_number: 3)
SongComposesAlbum.create(song_id: readmymind.id, album_id: samstown.id, track_number: 6)
SongComposesAlbum.create(song_id: human.id, album_id: dayandage.id, track_number: 2)
SongComposesAlbum.create(song_id: theway.id, album_id: yourstruly.id, track_number: 8)
SongComposesAlbum.create(song_id: problem.id, album_id: myeveything.id, track_number: 2)
SongComposesAlbum.create(song_id: onelasttime.id, album_id: myeveything.id, track_number: 3)
SongComposesAlbum.create(song_id: lovemeharder.id, album_id: myeveything.id, track_number: 9)
SongComposesAlbum.create(song_id: intoyou.id, album_id: dangerouswoman.id, track_number: 4)

juanzv = User.create(email: 'juanjoze0424@gmail.com', username: 'juanzv', password: 'juanzv', role: :admin)
ximeml = User.create(email: 'ana.ximeena@hotmail.com', username: 'ximeml', password: 'ximeml', role: :admin)
miguelgc = User.create(email: 'jgarciacebada@yahoo.com.mx', username: 'miguelgc', password: 'miguelgc', role: :user)
rooy = User.create(email: 'rba.tecno@gmail.com', username: 'rooy', password: 'rooy', role: :user)

juanplaylist = Playlist.create(name: 'Juan Favorites', user_id: juanzv.id)
ximenaplaylist = Playlist.create(name: "Xime's Playlist", user_id: ximeml.id)
jefeplaylist = Playlist.create(name: 'La Jefa De Las Listas', user_id: miguelgc.id)
rooyplaylist = Playlist.create(name: "Rooy's Playlist", user_id: rooy.id)

juanplaylist.songs<<lightsout

ximenaplaylist.songs<<onelasttime
ximenaplaylist.songs<<lifetimes

jefeplaylist.songs<<problem

rooyplaylist.songs<<madness
