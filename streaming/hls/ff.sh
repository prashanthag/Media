#!/bin/sh
#ffmpeg -v info -rtsp_transport tcp -i rtsp://localhost:5540/1280x720 -c:v copy -c:a aac  -hls_time 0.2 -hls_wrap 10 -start_number 1  test.m3u8
ffmpeg -v info -rtsp_transport tcp -i rtsp://localhost:5540/1280x720 -c:v copy -c:a aac  -hls_time 0.2 -hls_wrap 10 -start_number 1 -hls_key_info_file file.keyinfo test.m3u8
