package scala.meta.internal.metals

import java.nio.file._

sealed abstract class ClasspathElementPart
case class PackageElementPart(name: Path) extends ClasspathElementPart
case class ClassfileElementPart(name: Path) extends ClasspathElementPart
