from pytube import Playlist

# Replace with your YouTube playlist URL
playlist_url = "https://www.youtube.com/watch?v=z-diRlyLGzo&list=PLldRXoeaXPNm2wL1iy2fBMc55c1T8ZLhp"

# Initialize the playlist
playlist = Playlist(playlist_url)

# Set the download directory (optional)
download_dir = ""

# Iterate through each video in the playlist
for video in playlist.videos:
    try:
        # Download the highest quality stream (audio only)
        stream = video.streams.filter(only_audio=True).first()
        stream.download(output_path=download_dir)
        print(f"Downloaded: {video.title} for shohan!")
    except Exception as e:
        print(f"Error downloading {video.title}: {str(e)}")

print("Download complete!")
