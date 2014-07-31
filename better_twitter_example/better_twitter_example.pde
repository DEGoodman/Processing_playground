//https://apps.twitter.com/app/6396472/show//

import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;

Twitter twitter;
String searchString = "#worldcuo";
List<Status> tweets;

int currentTweet;

void setup()
{
    size(800,600);
    frameRate(20);

    ConfigurationBuilder cb = new ConfigurationBuilder();
    cb.setOAuthConsumerKey("Y825tvkGAoQHjbYLjuBTf8Fu4");
    cb.setOAuthConsumerSecret("A8aghmiEr9QRP9XBqkXAK8Z2oaSu8UL7odvnxcxILquGFfIenv");
    cb.setOAuthAccessToken("1077330110-eAur81HApUtbzFFiiMiD9zvbWQhIrafBZQ8tjqT");
    cb.setOAuthAccessTokenSecret("7DcoHt13y2HGmH4SVNXWNsy9Rz1nC4oAwfIUiOAt7vh51");

    TwitterFactory tf = new TwitterFactory(cb.build());

    twitter = tf.getInstance();

    getNewTweets();

    currentTweet = 0;

    thread("refreshTweets");
}

void draw()
{
    fill(0, 20);
    rect(0, 0, width, height);

    currentTweet = currentTweet + 1;

    if (currentTweet >= tweets.size())
    {
        currentTweet = 0;
    }

    Status status = tweets.get(currentTweet);

    fill(200);
    text(status.getText(), random(width), random(height), 300, 200);

    delay(150);
}

void getNewTweets()
{
    try 
    {
        Query query = new Query(searchString);

        QueryResult result = twitter.search(query);

        tweets = result.getTweets();
    } 
    catch (TwitterException te) 
    {
        System.out.println("Failed to search tweets: " + te.getMessage());
        System.exit(-1);
    } 
}

void refreshTweets()
{
    while (true)
    {
        getNewTweets();

        println("Updated Tweets"); 

        delay(30000);
    }
}
