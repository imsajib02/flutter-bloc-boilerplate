abstract class EntityConvertible<M, E> {

  M fromEntity(E entity);
  E toEntity();
}