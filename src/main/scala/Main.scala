import java.io._ 
import java.io.File
import java.io.FileInputStream
import javax.xml.xquery
import javax.xml.xquery.XQDataSource
import com.saxonica.xqj.SaxonXQDataSource


object Main extends App {
  println("xq")
  val inputStream = new FileInputStream(new File(args(0)))
  val ds = new SaxonXQDataSource
  val conn = ds.getConnection
  val exp = conn.prepareExpression(inputStream)
  val results = exp.executeQuery()


  val f = new File("xquery-output.xml")
  val w = new BufferedWriter(new FileWriter(f))

  while(results.next()) {
    w.write(results.getItemAsString(null))
  	w.flush()
  }

  w.close
}
