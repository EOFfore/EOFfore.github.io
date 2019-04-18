import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ReadXmlFile {
    public static void main(String[] args) {

        //QueryXmlDataFile("data.xml");//查询函数
        //sortBymark();
        updateXMLFile();
    }
//筛选出国产评分前十的电影
    public static void sortBymark(){
        File file = new File("data.xml");
        List<Movie> movies = readXMLFile(file);
        for(int i=movies.size()-1;i>0;i--){
            //从最右端，每进行一次循环排好一个位置
            for(int j=0;j<i;j++){
                if(movies.get(j).getMark()<movies.get(j+1).getMark()){
                    Collections.swap(movies,j,j+1);
                }
            }
        }
        int n=0;
        for (Movie movie : movies){

            if((movie.getProdution().equals("中国"))&&(n<10))
            {
            System.out.println("电影名称 : " + movie.getName());
            System.out.println("电影类型 ：" + movie.getType());
            System.out.println("电影时长" + movie.getDuration());
            System.out.println("制片国家 ：" + movie.getProdution());
            System.out.println("上映时间" + movie.getShowDate() + "       上映国家 ：" + movie.getShowDate_country());
            System.out.println("电影简介 ：" + movie.getBrief());
            System.out.println("电影链接 : " + movie.getRes());
            System.out.println("评分 ：" + movie.getMark());
            System.out.println("导演 ：" + movie.getDirector());
            System.out.println("主演 ：" + movie.getActor());
            System.out.println();
            System.out.println();

            System.out.println("----------------------------------------------------------------------");
            n++;
            }
        }
    }

    public static void QueryXmlDataFile(String str) {
        File file = new File(str);
        List<Movie> movies = readXMLFile(file);

        for (Movie movie : movies) {
            System.out.println("电影名称 : " + movie.getName());
            System.out.println("电影类型 ：" + movie.getType());
            System.out.println("电影时长" + movie.getDuration());
            System.out.println("制片国家 ：" + movie.getProdution());
            System.out.println("上映时间" + movie.getShowDate() + "       上映国家 ：" + movie.getShowDate_country());
            System.out.println("电影简介 ：" + movie.getBrief());

            System.out.println("电影链接 : " + movie.getRes());
            System.out.println("评分 ：" + movie.getMark());
            System.out.println("导演 ：" + movie.getDirector());
            System.out.println("主演 ：" + movie.getActor());
            System.out.println();
            System.out.println();
            System.out.println();
            System.out.println("----------------------------------------------------------------------");

        }
    }
    public static List<Movie> readXMLFile(File file) {
        List<Movie> lists = new ArrayList<>();
        try {

            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(file);
            NodeList movieList = doc.getElementsByTagName("item");
            for (int i = 0; i < movieList.getLength(); i++) {
                Node movieNode = movieList.item(i);
                if (movieNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element movieElement = (Element) movieNode;
                    Movie movie = new Movie();
                    movie.setName(movieElement.getElementsByTagName("name").item(0).getTextContent());
                    movie.setType(movieElement.getElementsByTagName("type").item(0).getTextContent());
                    movie.setDuration(movieElement.getElementsByTagName("duration").item(0).getTextContent());
                    movie.setProdution(movieElement.getElementsByTagName("production").item(0).getTextContent());
                    movie.setBrief(movieElement.getElementsByTagName("brief").item(0).getTextContent());
                    movie.setPoster(movieElement.getElementsByTagName("poster").item(0).getTextContent());

                    Element dateElement =(Element)movieElement.getElementsByTagName("showDate").item(0);
                    movie.setShowDate(dateElement.getTextContent());
                    movie.setShowDate_country(dateElement.getAttribute("country"));

                    Element resElement=(Element)movieElement.getElementsByTagName("res").item(0);
                    movie.setRes(resElement.getTextContent());

                    movie.setMark(Double.valueOf(movieElement.getElementsByTagName("mark").item(0).getTextContent()));

                    movie.setDirector(movieElement.getElementsByTagName("director").item(0).getTextContent());
                    movie.setActor(movieElement.getElementsByTagName("actor").item(0).getTextContent());


                    lists.add(movie);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lists;
    }
    public static void updateXMLFile(){
        String filePath = "data.xml";
        File xmlFile = new File(filePath);
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder;
        try {
            dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);

            doc.getDocumentElement().normalize();

            stressAttribute(doc);

            //write the updated document to file or console
            doc.getDocumentElement().normalize();

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File("data_updated.xml"));
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.transform(source, result);
            System.out.println("XML file updated successfully");

        } catch (SAXException| ParserConfigurationException | IOException | TransformerException e1) {
            e1.printStackTrace();
        }
    }
    public static void stressAttribute(Document doc){
        NodeList movies = doc.getElementsByTagName("information");
        Element mov= null;
        //loop for each movies
        for(int i=0; i<movies.getLength();i++){
           mov = (Element) movies.item(i);
            Node briefNode = mov.getElementsByTagName("brief").item(0);
            mov.removeChild(briefNode);
            Node durationNode = mov.getElementsByTagName("duration").item(0);
            mov.removeChild(durationNode);
            Node productionNode = mov.getElementsByTagName("production").item(0);
            mov.removeChild(productionNode);
            Node showDateNode = mov.getElementsByTagName("showDate").item(0);
            mov.removeChild(showDateNode);
            Node posterNode = mov.getElementsByTagName("poster").item(0);
            mov.removeChild(posterNode);
        }

    }

    }

