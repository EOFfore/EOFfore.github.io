package sax;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

public class Myhandler extends DefaultHandler {

        public static void main(String[] args) {
            File file = new File("e:/tempData.xml");
            try {
                SAXParserFactory spf = SAXParserFactory.newInstance();
                SAXParser parser = spf.newSAXParser();
                SaxHandler handler = new SaxHandler("item");
                parser.parse(new FileInputStream(file), handler);

                List<film> filmList = handler.getfilms();
                for(sax.film film : filmList){
                    System.out.println(film.getName()+"\n"+film.getType()+"\n"+film.getDuration()
                            +"\n"+film.getProduction()+"\n"+film.getShowDate()+"\n"+film.getCountry()+"\n"+film.getBrief()
                            +"\n"+film.getPoster()+"\n"+film.getRes()+"\n"+film.getMark()+"\n"+film.getDirector()
                            +"\n"+film.getActor());
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    }

class SaxHandler extends DefaultHandler {
    private List<sax.film> films = null;
    private sax.film film;
    private String currentTag = null;
    private String currentValue = null;
    private String nodeName = null;

    public List<sax.film> getfilms() {
        return films;
    }

    public SaxHandler(String nodeName) {
        this.nodeName = nodeName;
    }

    @Override
    public void startDocument() throws SAXException {
        // TODO 当读到一个开始标签的时候，会触发这个方法
        super.startDocument();

        films = new ArrayList<sax.film>();
    }

    @Override
    public void endDocument() throws SAXException {
        // TODO 自动生成的方法存根
        super.endDocument();
    }

    @Override
    public void startElement(String uri, String localName, String name,
                             Attributes attributes) throws SAXException {
        // TODO 当遇到文档的开头的时候，调用这个方法
        super.startElement(uri, localName, name, attributes);

        if (name.equals(nodeName)) {
            film = new film();
        }
        if (attributes != null && film != null) {
            for (int i = 0; i < attributes.getLength(); i++) {
                if(attributes.getQName(i).equals("country")){
                    film.setCountry(attributes.getValue(i));
                }
            }
        }
        currentTag = name;
    }

    @Override
    public void characters(char[] ch, int start, int length)
            throws SAXException {
        // TODO 这个方法用来处理在XML文件中读到的内容
        super.characters(ch, start, length);

        if (currentTag != null && film != null) {
            currentValue = new String(ch, start, length);
            if (currentValue != null && !currentValue.trim().equals("") && !currentValue.trim().equals("\n")) {
                if(currentTag.equals("name")){
                    film.setName(currentValue);
                }
                else if(currentTag.equals("type")){
                    film.setType(currentValue);
                }
                else if(currentTag.equals("duration")){
                    film.setDuration(currentValue);
                }
                else if(currentTag.equals("production")){
                    film.setProduction(currentValue);
                }
                else if(currentTag.equals("showDate")){
                    film.setShowDate(currentValue);
                }
                else if(currentTag.equals("brief")){
                    film.setBrief(currentValue);
                }
                else if(currentTag.equals("poster")){
                    film.setPoster(currentValue);
                }
                else if(currentTag.equals("res")){
                    film.setRes(currentValue);
                }
                else if(currentTag.equals("mark")){
                    film.setMark(currentValue);
                }
                else if(currentTag.equals("director")){
                    film.setDirector(currentValue);
                }
                else if(currentTag.equals("actor")){
                    film.setActor(currentValue);
                }
            }
        }
        currentTag = null;
        currentValue = null;
    }

    @Override
    public void endElement(String uri, String localName, String name)
            throws SAXException {
        // TODO 在遇到结束标签的时候，调用这个方法
        super.endElement(uri, localName, name);

        if (name.equals(nodeName)) {
            films.add(film);
        }
    }


}
