import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;




public class driver extends Configured implements Tool {
	public int run(String[]args)throws Exception{
		if(args.length<2){
			System.out.println("Please give input and output directly");
			return -1;
		}
		JobConf Conf=new JobConf(driver.class);
		Conf.setJobName("wordcount");
		
		FileInputFormat.setInputPaths(Conf, new Path(args[0]));
		FileOutputFormat.setOutputPath(Conf, new Path(args[1]));
		
		Conf.setMapperClass(MapWordCount.class);
		Conf.setReducerClass(wordcountReducer.class);
		
		Conf.setMapOutputKeyClass(Text.class);
		Conf.setMapOutputValueClass(IntWritable.class);
		
		Conf.setOutputKeyClass(Text.class);
		Conf.setOutputValueClass(IntWritable.class);
		
		JobClient.runJob(Conf);
		return 0;
	}
	public static void main (String args[]) throws Exception
	{
		int exitCode = ToolRunner.run(new driver(), args);
		System.exit(exitCode);
		
		}
	}



