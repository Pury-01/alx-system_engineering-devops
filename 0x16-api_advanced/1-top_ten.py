#!/usr/bin/python3
"""
queries the Reddit API and prints the titles of the first 10 hot posts.
"""
import requests


def top_ten(subreddit):
    """Returns the first 10 hot posts for a given subreddit."""
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=10"
    headers = {"User-Agent": "python:subreddit.top.ten:v3.4.3"}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        data = response.json()
        posts = data.get("data", {}).get("children", [])
        if posts:
            for post in posts:
                print(post.get("data", {}).get("title"))
        else:
            print("None")
    else:
        print("None")
