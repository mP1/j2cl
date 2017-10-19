/*
 * Copyright 2015 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package com.google.j2cl.ast;

import static com.google.common.base.Preconditions.checkNotNull;

import com.google.j2cl.ast.annotations.Visitable;
import com.google.j2cl.common.SourcePosition;
import java.util.ArrayList;
import java.util.List;

/**
 * Switch Statement.
 */
@Visitable
public class SwitchStatement extends Statement {
  @Visitable Expression switchExpression;
  @Visitable List<Statement> bodyStatements = new ArrayList<>();

  public SwitchStatement(
      SourcePosition sourcePosition, Expression switchExpression, List<Statement> bodyStatements) {
    super(sourcePosition);
    this.switchExpression = checkNotNull(switchExpression);
    this.bodyStatements.addAll(checkNotNull(bodyStatements));
  }

  public Expression getSwitchExpression() {
    return switchExpression;
  }

  public List<Statement> getBodyStatements() {
    return bodyStatements;
  }

  @Override
  public SwitchStatement clone() {
    return new SwitchStatement(
        getSourcePosition(), switchExpression.clone(), AstUtils.clone(bodyStatements));
  }

  @Override
  public Node accept(Processor processor) {
    return Visitor_SwitchStatement.visit(processor, this);
  }
}