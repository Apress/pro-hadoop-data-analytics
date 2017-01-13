/** A very simple example from Chapter 6
 * Please note that the documentation on use of Lingpipe, Gate, Stanford NLP, and the various
 * Semantic Web and NLP Big Data packages are quite extensive. One good reference in print is 
 * "Building Search Applications: Lucene, Lingpipe, and Gate First Edition", by Manu-Konchady.
 */
package com.apress.probda.nlp;

import java.io.*;
import java.util.*;
import edu.stanford.nlp.io.*;
import edu.stanford.nlp.ling.*;
import edu.stanford.nlp.pipeline.*;
import edu.stanford.nlp.trees.*;
import edu.stanford.nlp.util.*;

public class LingPipeExample {

	public static void main(String[] args) throws IOException {
		PrintWriter out;
		if (args.length > 1) {
			out = new PrintWriter(args[1]);
		} else {
			out = new PrintWriter(System.out);
		}
		PrintWriter xmlOut = null;
		if (args.length > 2) {
			xmlOut = new PrintWriter(args[2]);
		}
		StanfordCoreNLP pipeline = new StanfordCoreNLP();
		Annotation annotation;
		if (args.length > 0) {
			annotation = new Annotation(IOUtils.slurpFileNoExceptions(args[0]));
		} else {
			annotation = new Annotation("This is a test sentence for Pro Big Data Hadoop Analytics test purposes");
		}
		pipeline.annotate(annotation);
		pipeline.prettyPrint(annotation, out);
		if (xmlOut != null) {
			pipeline.xmlPrint(annotation, xmlOut);
		}
		// An Annotation is a Map and you can get and use the various analyses
		// individually.
		// For instance, this gets the parse tree of the first sentence in the
		// text.
		List<CoreMap> sentences = annotation.get(CoreAnnotations.SentencesAnnotation.class);
		if (sentences != null && sentences.size() > 0) {
			CoreMap sentence = sentences.get(0);
			Tree tree = sentence.get(TreeCoreAnnotations.TreeAnnotation.class);
			out.println();
			out.println("The first sentence parsed is:");
			tree.pennPrint(out);
		}
	}
}
