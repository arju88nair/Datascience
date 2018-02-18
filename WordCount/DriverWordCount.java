package com.impetus.code.examples.hadoop.mapred.wordcount; 

import javax.xml.soap.Text;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.TextInputFormat;
import org.apache.hadoop.mapred.TextOutputFormat;


public class DriverWordCount
{ 

public static void main(String[] args) throws Exception 
 { 
JobConf conf = new JobConf(DriverWordCount.class); 
conf.setJobName("wordcount"); 

conf.setOutputKeyClass(Text.class); 
conf.setOutputValueClass(IntWritable.class); 

conf.setMapperClass(MapperTest.class); 
conf.setCombinerClass(ReduceTest.class); 
conf.setReducerClass(ReduceTest.class); 

conf.setInputFormat(TextInputFormat.class); 
conf.setOutputFormat(TextOutputFormat.class); 

FileInputFormat.setInputPaths(conf, new Path(args[0])); 
FileOutputFormat.setOutputPath(conf, new Path(args[1])); 

JobClient.runJob(conf); 

 } 
}

